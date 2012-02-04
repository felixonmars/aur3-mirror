/*
 * Bluemote - use your Bluetooth enabled T610 or compatible Sony Ericsson phone as
 * a remote for your PC.
 * Copyright (C) 2004
 * Saravana K Kannan <saravkrish at uky dot edu>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 */


#include <stdio.h>
#include <termios.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include "bluemote.h"
#include "serial.h"

int comport=-1;
struct termios oldtio,newtio;

int openport(char *serdev)
{
 comport = open(serdev, O_RDWR | O_NOCTTY ); 
 if (comport <0) return -1;

 tcgetattr(comport,&oldtio); /* save current serial port settings */
 bzero(&newtio, sizeof(newtio)); /* clear struct for new port settings */

 newtio.c_cflag = BAUDRATE | CRTSCTS | CS8 | CLOCAL | CREAD;
 newtio.c_cflag &= ~ECHO;
 newtio.c_iflag = IGNCR; //IGNPAR | ICRNL;
 newtio.c_oflag = 0;
 newtio.c_lflag = 0; //ICANON;
 newtio.c_cc[VTIME]    = 0;     /* inter-character timer unused */
 newtio.c_cc[VMIN]     = 1;     /* blocking read until 1 character arrives */

 tcflush(comport, TCIOFLUSH);
 if(tcsetattr(comport,TCSANOW,&newtio) == -1) return -1;

 return comport;
}

int initport()
{
 int ret;
 char buf[MAXLINELEN]="";
 buf[0]=0;
 writeport("ATZ\r", 4);
 if((ret=waitfor("TZ", 2, TIMEOUT)) < 1) 
     if((ret=waitfor("OK", 2, TIMEOUT)) < 1) 
	 return ret;
 
 buf[0]=0;
 writeport("ATE=0\r", 6);
 if((ret=waitfor("TE", 2, TIMEOUT)) < 1) 
     if((ret=waitfor("OK", 2, TIMEOUT)) < 1) return ret;

 buf[0]=0;
 writeport("ATE=0\r", 6);
 if((ret=waitfor("OK", 2, TIMEOUT)) < 1) 
        return ret;

 return(1);
}

int readport(char *buf, int len, int wait)
{
 int cnt;

 myalarm(wait);
 cnt = read(comport,buf,len);
 myalarm(0);

 if(cnt==-1) return -errno;
 if(!cnt) return 0;

 buf[cnt]=0;
 strcpy(buf,buf+1);
 event_check(buf);
 logger("R",buf);
 return cnt;
}
 
int writeport(char *buf, int len)
{
 int cnt;

 cnt = write(comport,buf,len);
 if(cnt==-1) return cnt;

 logger("W",buf);

 return cnt;
}

int waitfor(char *str, int ntries, int wait)
{
 char buf[MAXLINELEN];
 int tries=0, ret;
 buf[0]=0;
 while(tries < ntries)
 {
  ret=readport(buf, MAXLINELEN, wait);
  tries++;
  if(ret==-EINTR) continue;
  if(ret<=0 || strncmp(buf, "ERROR", 5)==0) return -1;
  //printf("%s",buf);
  if(strncmp(buf, str, strlen(str))==0) return 1;
 }
 return 0;
}

void closeport()
{
 if(comport!=-1)
 {
  writeport("ATZ\r",4);
  waitfor("OK",1, TIMEOUT);
  /* restore the old port settings */
  tcsetattr(comport,TCSANOW,&oldtio);
  close(comport);
  comport=-1;
 }
}
