/* command to compile
  gcc -o email smtp.c -lcurl
 run ./email
 */

#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <curl/curl.h>
#include "smtp.h"
#define FROM_ADDR "<esbtest321@gmail.com>"
#define CC_ADDR "<rohitbhamu6@gmail.com>"

bool send_mail(char *to, char *from, char *subject, char *filename)
{
  //text is file path for JSON

  printf("Sending mail to %s\n", to);

  CURL *curl;
  CURLcode res = CURLE_OK;
  struct curl_slist *recipients = NULL;

  curl = curl_easy_init();
  if (curl)
  {
    /* This is the URL for your mailserver */
    curl_easy_setopt(curl, CURLOPT_USERNAME, from); // here it is "esbtest321@gmail.com" -saved in database
    curl_easy_setopt(curl, CURLOPT_PASSWORD, "testesb@321"); //enter password

    curl_easy_setopt(curl, CURLOPT_URL, "smtp://smtp.gmail.com:587/");
    curl_easy_setopt(curl, CURLOPT_USE_SSL, CURLUSESSL_ALL);

    curl_easy_setopt(curl, CURLOPT_MAIL_FROM, FROM_ADDR);

    recipients = curl_slist_append(recipients, to);
    recipients = curl_slist_append(recipients, CC_ADDR);
    curl_easy_setopt(curl, CURLOPT_MAIL_RCPT, recipients);

    //JSON file to be send
    char *filepath = filename;
    FILE *fd = fopen(filepath, "r");
    //         curl_easy_setopt(curl, CURLOPT_READDATA, fp);
    curl_easy_setopt(curl, CURLOPT_READDATA, fd);
    curl_easy_setopt(curl, CURLOPT_UPLOAD, 1L);

    /* Send the message */
    res = curl_easy_perform(curl);

    /* Check for errors */
    if (res != CURLE_OK)
    {
      fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
      return false;
    }
    /* Free the list of recipients */
    curl_slist_free_all(recipients);
    curl_easy_cleanup(curl);
  }
  printf("\n********| \"Mail sent successfully\" |********\n");
  return true;
}
// int main()
// {
//  // char *s = "HELL0";
//   int n=send_mail("rohitbhamu6@gmail.com","/home/rohit/Bat/esb_proj/src/esb_app/output_1.json");
// }
