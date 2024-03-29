#include "stdio.h"
#include "stdlib.h"
#include "sys/types.h"
#include "sys/socket.h"
#include "string.h"
#include "netinet/in.h"
#include <pthread.h>
#include "mysqlconnect.h"
#include "xml_parsing.h"
#include <mysql/mysql.h>
#include <unistd.h>
#include "handle_request.h"
#include "Authentication.h"

#define PORT 4444
#define BUF_SIZE 2000
#define CLADDR_LEN 100
#define SIZE 1024
#define NUM_THREADS 5

// to write the file in temporary file in directory its returns the filename
char* write_file(int sockfd)
{
  int n;
  FILE *fp;
  char buffer[SIZE];

  //Create unique filename using time stamp
  unsigned long tm=(unsigned long)time(NULL);
	char *filename = malloc(50 * sizeof(char));
	sprintf(filename, "./.tmp/BMD_%d_%lu.xml", sockfd, tm);  // if there are concurrency in request two file will have same name so we are using sockfd also
  fp = fopen(filename, "w"); //opening file in writing mode

  struct timeval tv;
  tv.tv_sec=1; //1 second timer
  setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, (const char*)&tv, sizeof tv);

  //usefull link : https://stackoverflow.com/questions/40493016/cant-receive-data-from-socket

  while(read(sockfd,buffer,SIZE)>=0){
    fprintf(fp, "%s", buffer);
    bzero(buffer, SIZE);
  }
  fclose(fp);
  return filename;
}

void* serve(void * fd){
  int sockfd=*(int*)fd;
  char * filename = write_file(sockfd); //send to write the input file into directory and return the filename
  MYSQL *con = connect_mysql(); // establish connection between the MySql and server
  bmd *request_message = do_parse(filename); // parse the BMD file and return BMD data structure 

  char * reply=malloc(500*sizeof(char));
  // Authenticating the request
  if(Authentication(request_message->envelop.Signature)){

    //------checking spcial case -> Check status functionality added--------- In case BMD request is for checking status for a particular corr ID
    if(strcmp(request_message->envelop.Destination,"ESB")==0 && strcmp(request_message->envelop.MessageType,"CheckStatus")==0){
      char * query=malloc(100*sizeof(char));
      sprintf(query,"select status from esb_request where id=%s",request_message->envelop.ReferenceID);
      if (mysql_query(con, query)){
        printf("ERROR : unable to query `%s` database.\n",query);
      }

      MYSQL_RES *result_rows = mysql_store_result(con);
      MYSQL_ROW result_row=mysql_fetch_row(result_rows);
      char * temp;
      if(!result_row){
        temp="null";
      }
      else{
        temp=result_row[0]; //returning first row and first column value
      }
      sprintf(reply,"-----------------------------------------------------------------------\n"
                    "STATUS regarding ID %s -> %s.\n"
                    "-----------------------------------------------------------------------\n",request_message->envelop.ReferenceID,temp);
    }
    else{
      // If authentication is done , we will do validation of request which requires to have some necessary fields in the BMD 

      if(validation(con, request_message, filename)){ 

        // At this point both authentication and validation are successful so now we can insert the request into esb_request.
        char * correlation_id=insert(con, request_message, filename); //saving corr ID which is returned by insert function 
        // printf("-->%s\n",correlation_id);
        sprintf(reply,"-----------------------------------------------------------------------\n"
                      "REQUEST ACCEPTED.\n"
                      "\"%s\" is your Correlation Id to check the status later.\n"
                      "-----------------------------------------------------------------------\n",correlation_id);
      }
      else{
        sprintf(reply,"-----------------------------------------------------------------------\n"
                      "VALIDATION FAILED.\n"
                      "-----------------------------------------------------------------------\n");
      }
    }
  }
  else{
    sprintf(reply,"-----------------------------------------------------------------------\n"
                  "AUTHENTICATION FAILED.\n"
                  "-----------------------------------------------------------------------\n");

  }
  if(write(sockfd, reply, strlen(reply))<0){
    printf("ERROR : NOT sended\n");
  }
  //freeing memory
  free(reply);
  mysql_close(con);
  close(sockfd);
  printf("Closing Client Socket FD %d.\n",sockfd);
  printf("**************************************\n\n");
  pthread_exit(NULL); // one request handling flow completed for an individual client.
}

void request_handler()
{
  //workflow starts here
  struct sockaddr_in addr, cl_addr; // Socket Variable declaration
  int sockfd, len, ret;  // Socket Variable declaration
  char buffer[BUF_SIZE];            // buffer size of declared BUF_SIZE
  pid_t childpid;                   // socket childpid
  char clientAddr[CLADDR_LEN];      // socket client address

  sockfd = socket(AF_INET, SOCK_STREAM, 0); // creating socket
  if (sockfd < 0)
  {
    printf("Error creating socket!\n");
    exit(1);
  }
  printf("Socket created...\n");

  if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &(int){1}, sizeof(int)) < 0){
    fprintf(stderr,"ERROR : setsockopt(SO_REUSEADDR) failed\n");
  }

  memset(&addr, 0, sizeof(addr)); // filling memory with a constant byte

  // server configarations
  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = INADDR_ANY;
  addr.sin_port = PORT;

  ret = bind(sockfd, (struct sockaddr *)&addr, sizeof(addr)); // binding socket
  if (ret < 0)
  {
    printf("Error binding!\n");
    exit(1);
  }
  printf("Binding done on PORT NUMBER %d ...\n",PORT);

  printf("Waiting for a connection...\n");
  listen(sockfd, NUM_THREADS); // Listening socket file discripter

  //We will use 5 threads which  can run parrallely
  pthread_t threads[NUM_THREADS];
  unsigned int count=0;
  len = sizeof(cl_addr);
  for (;;)
  { //infinite loop to continously listening

    int * clientsockfd=malloc(sizeof(int));
    *clientsockfd = accept(sockfd, (struct sockaddr *)&cl_addr, &len); // making connection
    if (*clientsockfd < 0)
    {
      printf("Error accepting connection!\n");  //when client closes, throws error accepting connection
      exit(1);
    }
    printf("Connection accepted for Client Socket FD %d.\n",*clientsockfd);

    // child thread will handle client ,
    if(pthread_create(&threads[count%NUM_THREADS],NULL,serve,clientsockfd)!=0){ // create a thread which will work on serve function.
			 printf ("ERROR: child thread not created\n");
			 exit(-1);
		}
    count++;
  }
  close(sockfd);
}
