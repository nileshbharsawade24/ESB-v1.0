#include<stdio.h>
#include<stdlib.h>
#include<mysql/mysql.h>
#include<string.h>
#include<pthread.h>
static char *host = "localhost";
static char *user = "root";
static char *pass = "Prideoflion@01";
static char *dbname = "pavan";
unsigned int port =3306;// active port in which mysql is running.
static char *unix_socket= NULL;
unsigned int flag=0; 
MYSQL *con;
MYSQL_RES *res,*res2;
MYSQL_ROW row,row1;
char *status,*sender,*dest,*msg_type;
char *id,*route_id;
int attempts;
typedef struct {
char *transport_key;
char *transport_value;
}transport;      //struct for storing the data from transport_config table.
#define DETAILS "select sender_id,dest_id,message_type from esb_request where id=%s"
#define ROUTE_ID "select route_id from routes where sender='%s' && destination='%s' && message_type='%s'"

char* check_transform(char *id){
	char t[20000];
	char *transform_key;
	snprintf(t,sizeof(t),DETAILS,id);
	if(mysql_query(con,t)){fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
	res2 = mysql_store_result(con);
	while(row1=mysql_fetch_row(res2))
	  	{
	 	for(int i=0;i<3;i++){
	 	
			//printf("%s | ",row1[i]);
			if(i==2){
				sender=row1[0];
				dest=row1[1];
				msg_type=row1[2];}
				
			}
		}t[20000]='\0';res2='\0';
	 snprintf(t,sizeof(t),ROUTE_ID,sender,dest,msg_type);
	 if(mysql_query(con,t)){fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
		res2 = mysql_store_result(con);
	while(row1=mysql_fetch_row(res2))
	  	{
					route_id=row1[0];
		}t[20000]='\0';res2='\0';row1='\0';
		
	snprintf(t,sizeof(t),"select config_key from transform_config where route_id=%s",route_id);
	if(mysql_query(con,t)){fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
		res2 = mysql_store_result(con);
	while(row1=mysql_fetch_row(res2))
	  	{
				transform_key=row1[0];
		}	
	 
	t[20000]='\0';res2='\0';row1='\0';
	return transform_key;			
}

transport check_transport(char *id){
 	char t[20000];
	transport data;
	snprintf(t,sizeof(t),DETAILS,id);
	if(mysql_query(con,t)){fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
	res2 = mysql_store_result(con);
	while(row1=mysql_fetch_row(res2))
	  	{
	 	for(int i=0;i<3;i++){
	 	
			//printf("%s | ",row1[i]);
			if(i==2){
				sender=row1[0];
				dest=row1[1];
				msg_type=row1[2];}
				
			}
		}t[20000]='\0';res2='\0';
	 snprintf(t,sizeof(t),ROUTE_ID,sender,dest,msg_type);
	 if(mysql_query(con,t)){fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
		res2 = mysql_store_result(con);
	while(row1=mysql_fetch_row(res2))
	  	{
					route_id=row1[0];
		}t[20000]='\0';res2='\0';
		
	snprintf(t,sizeof(t),"select config_key,config_value from transport_config where route_id=%s",route_id);
	if(mysql_query(con,t)){fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
		res2 = mysql_store_result(con);
	while(row1=mysql_fetch_row(res2))
	  	{
				data.transport_key=row1[0];
				data.transport_value=row1[1];
				
		}	
		t[20000]='\0';res2='\0';row1='\0';	
	return data;
}


 void* child_thread(char *id){
	printf("Child thread started to process the received BMD request\n");
	
	  char p[20000];
	  snprintf(p,sizeof(p),"update esb_request set status='Taken',processing_attempts=processing_attempts+1 where id=%s",id);
	  
	  	//printf("%s\n",p);
	  if(mysql_query(con,p)){fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
	  
	  printf("\n************** Status Updated Sucessfully at id=%s ****************\n\n",id);
	  
	  p[20000]='\0';
	  
	 char *transform_key=check_transform(id);//this function returns the "JSON" or"CSV" or"XML" string as transform_key which extracted from the transform_config table for the perticular sender,dest,msg_type.look at line no 26.
	 
	 
	 /* transformation process*/
	  if(strcmp(transform_key,"JSON")==0){//comparing to json.
	   printf("transforming to JSON\n");
	   //put function call for transformation to json here;
	   }
	  if(strcmp(transform_key,"CSV")==0){//comparing to json.
	  printf("transforming to CSV\n");
	  //put function call for transformation to csv here;
	  
	  } 
	  if(strcmp(transform_key,"XML")==0){
	  printf("transforming to XML\n");
	  //put function call for transformation to xml here;
	  }	  
	   /*transport process*/
	  transport t = check_transport(id);//this function returns the structure that includes transport_key i.e "HTTP" or "SMTP",tansport_value which is extracted from the transport_config table for the perticular sender,dest,msg_type.look at line no 67.
	  if(strcmp(t.transport_key,"SMTP")){
	  printf("transporting via SMTP\n");
	  //put function call for transport via SMTP here;
<<<<<<< HEAD
	  }
	  if(strcmp(t.transport_key,"HTTP")){
	  printf("transporting via HTTP\n");
	  //put function call for transport via HTTP here;
	  }
=======
	  }
	  if(strcmp(t.transport_key,"HTTP")){
	  printf("transporting via HTTP\n");
	  //put function call for transport via HTTP here;
	  }
>>>>>>> 986a2367745068aa51edee322728068f02d5dfdc
	  
	  
	}  

void start_esb_request_poller_thread(){
pthread_t childthread;
//mysql_data *data;

	while(true){
		if((mysql_query(con,"select *from esb_request where (status = 'Available' && processing_attempts <5) limit 4 "))){
			fprintf(stderr,"ERROR: %s [%d]\n",mysql_error(con),mysql_errno(con));
			exit(1);}
		
		res = mysql_store_result(con);
	
		
	 	while(row=mysql_fetch_row(res))
	  	{
	 	for(int i=0;i<=10;i++){
	 	
			//printf("%s | ",row[i]);
			if(i==10){
				id=row[0];
				status=row[8];
				attempts=row[10];}
				
			}
		}
		
		//printf("\n%s\n%s\n%s\n",temp1,temp2,temp3);
			
			if(status!='\0')
			{
				printf("\nReceived New BMD request, Ready to process the BMD.\n");
				if(pthread_create(&childthread,NULL,&child_thread,id)){
				printf("unable to create the Childthread\n");}
				//child_thread(id);
				status='\0';
				
				//pthread_join(&childthread,NULL);	
 	  		}
 	  	 		else{printf("\n****************** No Request Available in esb_request.*******************\n");}
 	  	
 		printf("\n");
 		sleep(5);
 	 
 	 }
 		
 }
int main(int argc,char *argv[]){
	
	pthread_t t1;
	
	con= mysql_init(NULL);// this fun initalizes the headerfiles i.e mysql.h
	
	if(!(mysql_real_connect(con,host,user,pass,dbname,port,unix_socket,flag)))//this is the real fun which connects to mysql-server.
	{
		fprintf(stderr, "ERROR: %s [%d]\n", mysql_error(con), mysql_errno(con));
		exit(1);
	}
	
	printf("Connected to mysql-server\n");
	if(pthread_create(&t1,NULL,&start_esb_request_poller_thread,NULL)){
	 	printf("unable to create the thread\n");}
	 	pthread_join(&t1,NULL);
	
 		mysql_close(con);
 		return 0;
 	}
