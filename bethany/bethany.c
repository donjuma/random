#include <sys/types.h>
#include <sys/dir.h>
#include <sys/param.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <stdint.h>
#include <fcntl.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

int bflag = 0;
int mflag = 0;
int fflag = 0;
int oflag = 0;
char query[2048];
char url[2048];
char stdOUT[17];

void print_usage(){
    printf("Usage: bethany mode [question]. For more info try: bethany -h.\nWhen in doubt, try: man bethany\n");
}

void response(){
    int len, i;
    if (oflag){
        printf("I have no idea...\n");
        exit(0);
    }else if (mflag){
        len = strlen(query);
        for (i = 0; i < len; i++){
            printf("%02X", query[i]);
        }
        printf("\n");
        exit(0);
    }else if (fflag){
        printf("Hmm.... let me check up on that dealy..\n\n");
        sleep(1.7);
        printf("While I look into that, lemme tell you a good joke!\n");
        sleep(2);
        printf("Why don't Canadians use wget?\n");
        sleep(4);
        printf("They're in love with curling\n\n");
        sleep(3);
        printf("Oh! I found the answer to that puppy!\n\n:)\n");
        sleep(1.7);
        strcat(url, query);
        strcat(url, stdOUT);
        system(url);
        exit(0);
    }else if (bflag){
        strcat(url, query);
        strcat(url, stdOUT);
        system(url);
        exit(0);
    }
}

int main(int argc, char **argv){
    int input, i, len;

    while ((input = getopt(argc, argv, "bmfoh")) != -1){
        switch (input){
            case 'b':
                bflag = 1;
                break;
            case 'm':
                mflag = 1;
                break;
            case 'f':
                fflag = 1;
                break;
            case 'o':
                oflag = 1;
                break;
            case 'h':
                print_usage();
                exit(0);
            default:
                print_usage();
                exit(0);
        }
    }
    strcat(stdOUT, " >/dev/null 2>&1");
    strcat(url, "x-www-browser http://lmgtfy.com?q=");
    for (i = optind; i < argc; i++){
        strcat(query, argv[i]);
        strcat(query, "+");
    }
    len = strlen(query);
    if (query[len - 1] == '+'){
        query[--len] = '\0';
    }
    response();
    //system(query);
    return 0;
}
