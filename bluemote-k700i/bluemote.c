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


#include <signal.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <errno.h>
#include "bluemote.h"
#include "ui.h"
#include "mouse.h"
#include "keyboard.h"
#include "serial.h"
#include "parse.h"
#include "ipc.h"

/* Global Variables */
char menufile[MAXLEN];

CONF *conf = NULL;

FUNC flist[FNCNT] = {
			{ "refresh()", refreshmenu },
			{ "tempdisconn()", tempdisconn },
			{ "quit()", quit },
			{ "about()", about },
			{ "volume()", volume },
			{ "mouse()", mouse },
			{ "keyboard()", keyboard }
		    };

int fncnt=7;

char args[MAXARGS][MAXARGLEN];
int argcnt = 0;
char buf[MAXLEN];
char logfile[MAXLEN];
int manual=TRUE, startup=TRUE;

int main(int argc, char *argv[])
{
 if(!init_cfg())
 {
  fprintf(stderr, "Unable to open config file or invalid content in config file.\n");
  exit(1);
 }
 
 parseopts(argc, argv, conf);

 if(conf->msg)
 {
  if(!open_producer())
  {
   printf("Unable to contact Bluemote server!\n");
   exit(1);
  }
  if(ipc_write(conf->device, strlen(conf->device))<=0)
  {
   printf("Unable to send message to Bluemote server!\n");
   close_producer();
   exit(1);
  }
  close_producer();
  exit(0);
 }
 else
 {
  if(!get_lock())
  {
   printf("Another instance of Bluemote already running!\n");
   exit(1);
  }

  if(!open_consumer())
  {
   printf("Unable to listen for messages!\n");
   exit(1);
  }
 }

 strcpy(logfile, getenv("HOME"));
 strcat(logfile, BLUEMOTEDIR);
 strcat(logfile, LOGFILE);

 printf("Setting up signal handlers.\n");
 logger("INIT", "Setting up signal handlers");
 if(!init_signals())
 {
  perror("init_signals()");
  exit(1);
 }

 if(conf->daemon)
 {
  printf("Entering daemon mode.\n");
  logger("INIT", "Entering daemon mode.\n");
  if(daemon(TRUE, FALSE)==-1)
  {
   printf("Unable to enter daemon mode. Exiting.\n");
   logger("ERROR", "Unable to enter daemon mode. Exiting.\n");
   exit(1);
  }
 }

 while(TRUE)
 {
  closeport();

  printf("Connecting to phone...\n");
  logger("INIT", "Connecting to phone...");
  while(openport(conf->device) == -1)
  {
   sprintf(buf,"Unable to connect to phone. Will retry after %d secs.",conf->retrysecs);
   logger("INIT", buf);
   sleep(conf->retrysecs);
   logger("INIT", "Retrying...");
  }
  printf("Connected to phone.\n");
  logger("INIT", "Connected to phone.");
  
  printf("Initialising the connection.\n");
  logger("INIT", "Initialising the connection.\n");
  if(!initport()) exit(1);

  printf("Waiting for commands from phone\n");
  logger("INIT", "Waiting for commands from phone\n");

  /* Not looping to take care of timeout because timeout is very unlikely and
   * this function is called again inside remote(). In the worst case, the I/O
   * commands for Connect event won't have any effect. */
  if(init_mainmenu()==-1) continue;

  exec_event("Connect");
  if(!manual)
  {
   exec_event("MoveIn");
  }
  manual = FALSE;
  remote();
  if(!manual)
  {
   exec_event("MoveOut");
  }
  exec_event("Disconnect");
 }
 return(0);
}

int init_signals()
{
 struct sigaction handler;

 handler.sa_handler=signal_handler;
 if (sigfillset(&handler.sa_mask) < 0)
  return (0);
 handler.sa_flags = 0;
 if (sigaction(SIGINT, &handler, 0) < 0)
  return (0);
 if (sigaction(SIGTERM, &handler, 0) < 0)
  return (0);
 if (sigaction(SIGALRM, &handler, 0) < 0)
  return (0);

 return 1;
}

void signal_handler(int signal)
{
 switch(signal)
 {
  case SIGINT:
  case SIGTERM:
	printf("Interrupted by user.\nResetting serial port... ");
	logger("INFO", "Interrupted by user. Exiting.\n");
	close_consumer();
	closeport();
	printf("Done\n");
 	exit(0);
	break;
  case SIGALRM:
	break;
  default:
	close_consumer();
	closeport();
	exit(1);
 }
}

int myalarm(unsigned int msec)
{
 struct itimerval t;
 t.it_interval.tv_sec = 0;
 t.it_interval.tv_usec = 0;
 t.it_value.tv_sec = msec / 1000;
 t.it_value.tv_usec = (msec % 1000) * 1000;
 return setitimer(ITIMER_REAL, &t, NULL);
}

int init_cfg()
{
 char cfgfile[MAXLEN];

 strcpy(cfgfile, getenv("HOME"));
 strcat(cfgfile, BLUEMOTEDIR);
 strcat(cfgfile, CFGFILE);

 free(conf);
 conf = loadcfg(cfgfile);
 if(conf==NULL)
 {
  strcpy(cfgfile, "./");
  strcat(cfgfile, CFGFILE);
  conf = loadcfg(cfgfile);
 }

 if(conf==NULL)
  return 0;
 else
  return 1;
}

void logger(char *head, char *str)
{
 FILE *fplog;
 time_t logtime;
 char *timestr;
 
 if(conf->log)
 {
  fplog = fopen(logfile, "a");
  if(fplog!=NULL)
  {
   time(&logtime);
   timestr = ctime(&logtime);
   timestr[strlen(timestr)-1]=0;
   fprintf(fplog, "[%s] - ",timestr);
   if(head!=NULL)
    fprintf(fplog, "%s - ",head);
   fprintf(fplog, "%s\n",str);
   fclose(fplog);
  }
 }
}
  
int init_mainmenu()
{
 static char mmenustr[]= "AT*EAM=\"PC Remote\"\r";
 char cmd[MAXLEN];
 int ret;

 writeport("AT*ECAM=1\r", 10);
 if((ret=waitfor("OK", 2, TIMEOUT)) < 1) return ret;
 
 if(strlen(conf->charset))
 {
  sprintf(cmd, "AT+CSCS=\"%s\"\r",conf->charset);
  writeport(cmd, strlen(cmd));
  if((ret=waitfor("OK", 2, TIMEOUT)) < 1) return ret;
 }

 writeport(mmenustr, strlen(mmenustr));
 return waitfor("OK", 1, TIMEOUT);
}

void remote()
{
 int error=TRUE, choice=1, ask=FALSE;
 char buf[MAXLEN];
 int ret;

 while(TRUE)
 {
  if(error)
  {
   while((ret = init_mainmenu())==0);
   if(ret==1) error = FALSE;
   else return;
  }

  while (!error)
  {
   while((ret=waitfor("*EAAI", 1, TIMEOUT))==0)
    check_msg();

   if(ret==-1) error=TRUE;
   else ask=TRUE;

   while(ask && !error)
   {
    buf[0]=0;

    choice = submenu(choice);
    switch(choice)
    {
     case -1:
     	error=TRUE;
	ask=FALSE;
	choice=1;
	break;
     case 0:
     	ask=FALSE;
	choice=1;
     	break;
     default:
     	ask=TRUE;
	exec_menu(conf->menu[choice-1]);
	break;
    }
   }
  }
 }
}

int submenu(int def)
{
 int i, ret;
 char cmd[MAXLEN] = "AT*EASM=\"PC Remote\",1,";
 char buf[MAXLEN]="";

 if(def<=0 || def > conf->menucnt) def=1;
 sprintf(buf,"%d,%d", def, conf->menucnt);
 strcat(cmd, buf);
 for(i=0; i<conf->menucnt; i++)
 {
  strcat(cmd,",\"");
  strcat(cmd,conf->menu[i].text);
  strcat(cmd,"\"");
 }
 strcat(cmd,"\r");
 
 writeport(cmd, strlen(cmd));
 if(waitfor("OK", 1, TIMEOUT) != 1) return -1;

 while((ret = readport(buf, MAXLEN, TIMEOUT)) == -EINTR);
 if(ret <= 0) return -1;
 if(strncmp(buf, "*EAMI: ", 7)!=0) return -1;
 
 return(atoi(buf+7));
}

void check_msg()
{
 static MENU tmenu = {"User msg", 1 };

 ui_nextstate(0);
 while(ipc_read(tmenu.cmd[0], MCMDLEN)>0)
  if(tmenu.cmd[0][0]=='>')
   exec_menu(tmenu);
 ui_nextstate(1);
}
 

extern int comport;

int exec_menu(MENU menu)
{
 int i=0, cidx=0, fine;
 int off, ecnt=1;
 char tmp[MAXLEN];
 char output[MAXLEN];
 MENU tmenu = menu;
 int ret;
 int cpid;

 fine=1;
 while(cidx < tmenu.ncmd && fine)
 {
  off=1;
  switch(tmenu.cmd[cidx][0])
  {
   case '-':
   	if(*(tmenu.cmd[cidx] + off)=='!') off++;
   	parsecmd(tmenu.cmd[cidx] +off, tmp);
	cpid = fork();
	if(cpid)
	{
	 waitpid(cpid,&ret,0);
	 if(ret!=-1 && WIFEXITED(ret)) 
	  ret = WEXITSTATUS(ret);
	}
	else
	{
	 close(comport);
	 ret=system(tmp);
	 if(ret!=-1 && WIFEXITED(ret)) 
	  ret = WEXITSTATUS(ret);
	 exit(ret);
	}
	if(off==1) ret=1;
	break;
   case '+':
   	if(*(tmenu.cmd[cidx] + off)=='!') off++;
   	parsecmd(tmenu.cmd[cidx] +off, tmp);
	ret=execute(tmp, output, MAXLEN);
	sprintf(tmp, "$%d", ecnt++);
	setvar(tmp, output);
	if(off==1) ret=1;
	break;
   case '<':
	argcnt = split(tmenu.cmd[cidx]+1, args[0], MAXARGS, MAXARGLEN);
	substvar(args[0], MAXARGS, MAXARGLEN);
  	/*for(i=0; i<argcnt; i++)
   	 printf("%d: --%s--\n",i,args[i]);*/
	if(strcmp(args[0],"YesNo")==0 && argcnt==2)
	{
	 ret=get_yesno(args[1]);
	 sprintf(output,"%d",ret-1);
	 setvar("$YesNo",output);
	}
	if(strcmp(args[0],"OnOff")==0 && argcnt==3)
	{
	 ret=get_onoff(args[1], atoi(args[2]));
	 sprintf(output,"%d",ret-1);
	 setvar("$OnOff",output);
	}
	if(strcmp(args[0],"Percent")==0 && argcnt==4)
	{
	 ret=get_percent(args[1], atoi(args[2]), atoi(args[3]));
	 sprintf(output,"%d",ret-1);
	 setvar("$Percent",output);
	}
	if(strcmp(args[0],"Choice")==0 && argcnt>=4)
	{
	 init_choice();
	 for(i=3; i<argcnt; i++)
	  addchoice(args[i]);
	 ret=get_choice(args[1], atoi(args[2]));
	 sprintf(output,"%d",ret);
	 setvar("$Choice",output);
	}
	if(strcmp(args[0],"Real")==0 && (argcnt==4 || argcnt==5))
	{
	 if(argcnt==4) strcpy(args[4],"");
	 ret=get_real(output, args[1], args[2], args[3], args[4]);
	 setvar("$Real",output);
	}
	if(strcmp(args[0],"Int")==0 && (argcnt==5 || argcnt==6))
	{
	 if(argcnt==5) strcpy(args[5],"0");
	 ret=get_integer(output, args[1], args[2], atoi(args[3]), atoi(args[4]), atoi(args[5]));
	 setvar("$Int",output);
	}
	if(strcmp(args[0],"Phone")==0 && (argcnt==3 || argcnt==4))
	{
	 if(argcnt==3) strcpy(args[3],"");
	 ret=get_phone(output, args[1], args[2], args[3]);
	 setvar("$Phone",output);
	}
	if(strcmp(args[0],"Date")==0 && argcnt==2)
	{
	 ret=get_date(output, args[1]);
	 setvar("$Date",output);
	}
	if(strcmp(args[0],"Text")==0 && (argcnt==4 || argcnt==5))
	{
	 if(argcnt==4) strcpy(args[4],"");
	 ret=get_text(output, args[1], args[2], atoi(args[3]), args[4]);
	 setvar("$Text",output);
	}
	if(strcmp(args[0],"Secret")==0 && argcnt==4)
	{
	 ret=get_secret(output, args[1], args[2], atoi(args[3]));
	 setvar("$Secret",output);
	}
	break;
   case '>':
	argcnt = split(tmenu.cmd[cidx]+1, args[0], MAXARGS, MAXARGLEN);
	substvar(args[0], MAXARGS, MAXARGLEN);
  	/*for(i=0; i<argcnt; i++)
   	 printf("%d: --%s--\n",i,args[i]);*/
	if(strcmp(args[0],"MsgBox")==0 && (argcnt==2 || argcnt==3))
	{
	 if(argcnt==2) strcpy(args[2],"");
	 ret=msgbox(args[1], atoi(args[2]));
	}
	if(strcmp(args[0],"Info")==0 && argcnt>=3)
	 ret=info(args[1], args[2]);
	if(strcmp(args[0],"Status")==0 && argcnt>=2)
	 ret=status(args[1]);
	break;
   case ':':
   	for(i=0; i<fncnt; i++)
	 if(strcmp(tmenu.cmd[cidx]+1,flist[i].name)==0)
	  ret = flist[i].fn();
	break;
  }
  if(ret<=0) fine=0;
  cidx++;
 }
 return 0;
}

int event_check(char *buf)
{
 char *tmp1, *tmp2, tmpbuf[MAXLEN], event[MAXLEN];
 int len;
 
 if(strncmp(buf, "RING", 4)==0) 
 {
  exec_event("Ring");
  return(1);
 }
 
 if(strncmp(buf, "*ECAV: 1,", 9)==0)
 {
  if(strncmp(buf, "*ECAV: 1,6,1,", 13)==0 || strncmp(buf, "*ECAV: 1,1,1,", 13)==0)
  {
   if(strncmp(buf, "*ECAV: 1,6,1,", 13)==0) strcpy(event, "IncomingCall");
   if(strncmp(buf, "*ECAV: 1,1,1,", 13)==0) strcpy(event, "OutgoingCall");
   tmp1=strchr(buf+13, ',');
   if(tmp1==NULL) return(1);
   tmp1=strchr(tmp1+1, ',');
   if(tmp1==NULL) return(1);
   tmp1++;
   tmp2=strchr(tmp1, ',');
   if(tmp2==NULL) return(1);
   len=tmp2-tmp1;
   strncpy(tmpbuf,tmp1, len);
   tmpbuf[len]=0;
   setvar("$PhoneNumber",tmpbuf);
   exec_event("Call");
   exec_event(event);
  }
  if(strncmp(buf, "*ECAV: 1,3,1", 12)==0)
  {
   exec_event("CallStart");
  }
  if(strncmp(buf, "*ECAV: 1,0,1,08,016", 19)==0)
  {
   exec_event("CallEnd");
  }
  if(strncmp(buf, "*ECAV: 1,0,1,08,222", 19)==0 || strncmp(buf, "*ECAV: 1,0,1,08,017", 19)==0)
  {
   exec_event("CallAbort");
  }
  return(1);
 }

 if(strncmp(buf, "+CALV: 1", 8)==0)
 {
  exec_event("Alarm");
  return(1);
 }

 return(0);
}

int exec_event(char *event)
{
 int i=0;
 char tmp[MAXLEN];

 sprintf(tmp, "Event %s occurred.", event);
 logger("INFO",tmp);
 while(i < conf->eventcnt && strcmp(event,conf->event[i].text)) i++;

 if(i < conf->eventcnt)
 {
  return(exec_menu(conf->event[i]));
 }
 return(1);
}

int execute(char *cmd, char *result, int rlen)
{
 FILE *pp;
 int i=0, status;
 char ch;

 pp = popen(cmd, "r");
 
 if(pp == NULL) return -1;
 while(i < (rlen-1) && (ch=fgetc(pp))!=EOF) result[i++]= (ch=='\r' || ch=='\n') ? ' ':ch;
 result[i]=0;
 
 status = pclose(pp);

 if(status==-1) return -1;
 if(WIFEXITED(status)) return (WEXITSTATUS(status));
 else return -1;
}

int tempdisconn()
{
 manual = TRUE;
 printf("Disconnecting for a minute...\n");
 logger("INFO","Disconnecting for a minute...");
 closeport();
 sleep(60);
 return 1;
}

int quit()
{
 printf("Quit request from user.\nResetting serial port... ");
 logger("INFO", "Quit request from user. Quitting.\n");
 close_consumer();
 closeport();
 printf("Done\n");
 exit(0);
}

int getvol()
{
 char tmp[20];

 /* if(execute("aumix-minimal -q | grep pcm | awk '{print $3}'", tmp, 20)==-1) return -1;
 else return atoi(tmp); */
 if(execute(conf->getvol, tmp, 20)==-1) return -1;
 else return atoi(tmp);
}

int setvol(int vol)
{
 char tmp[50];

 sprintf(tmp, "%s %d", conf->setvol, vol);
 return system(tmp);
}

int volume()
{
 int ret, vol;
 char cmd[MAXLEN];
 char buf[MAXLEN]="";

 vol=getvol();
 if(vol==-1) return -1;
 
 sprintf(cmd, "AT*EAID=4,1,\"Volume\",10,%d\r", (int) ((vol/10.0)+.5));
 
 writeport(cmd, strlen(cmd));
 if(waitfor("OK", 1, TIMEOUT) != 1) return -1;

 while(1)
 {
  while((ret = readport(buf, MAXLEN, TIMEOUT)) == -EINTR);
  if(ret <= 0) return -1;
  if(strncmp(buf, "*EAII: 15,",10)==0) setvol(atoi(buf+10));
  if(strncmp(buf, "*EAII: 0", 8)==0 || strncmp(buf, "*EAAI", 5)==0)
  {
   setvol(vol);
   return 0;
  }
  if(strncmp(buf, "*EAII: 4,",9)==0)
  {
   setvol(atoi(buf+9));
   return 1;
  }
 }
}

int about()
{
 return msgbox("Bluemote v2.0 - by Saravana Krishnan Kannan",0);
}

int mouse()
{
 int ret=-1, go=1;
 char cmd1[]= "AT*EAID=1,1,\"Use joystick to move mouse & keypad for clicks\"\r";
 char cmd2[]= "AT+CMER=3,2,,,\r";
 char cmd3[]= "AT+CMER=0,0,,,\r";
 char buf[MAXLEN]="";
 char key;
 int status, mdelta=15, mwait=MOUSE_DELAY;
 int mup=0, mdown=0, mleft=0, mright=0;
 int mbleft=0, mbright=0, mbmiddle=0, mtoggle=0;

 Display *dpy = XOpenDisplay (NULL);

 if(dpy==NULL) return -1;
 writeport(cmd1, strlen(cmd1));
 if(waitfor("OK", 1, TIMEOUT) != 1) go = 0;
 
 writeport(cmd2, strlen(cmd2));
 if(waitfor("OK", 1, TIMEOUT) != 1) go = 0;
 
 while(go)
 {
  buf[0]=0;
  ret = readport(buf, MAXLEN, mwait);
  if( (ret <= 0 && ret != -EINTR) || strncmp(buf, "ERROR", 5)==0 )
  {
   ret=-1;
   break;
  }
  if(strncmp(buf, "*EAII: ", 7)==0 || strncmp(buf, "*EAAI", 5)==0)
  {
   ret=1;
   break;
  }
  if(strncmp(buf, "+CKEV: ", 7)==0)
  {
   key=buf[7];
   status=strchr(buf,',')[1]-'0';
   switch(key)
   {
    //Simply assume it's joy up coz T610 key report is buggy
    //case 27:
    // K700i is not buggy!
    case '^':
    case '5':
	mup=status;
	mwait=MOUSE_DELAY;
	break;
    case 'v':
    case '8':
	mdown=status;
	mwait=MOUSE_DELAY;
	break;
    case '<':
    case '4':
    case '7':
	mleft=status;
	mwait=MOUSE_DELAY;
	break;
    case '>':
    case '6':
    case '9':
	mright=status;
	mwait=MOUSE_DELAY;
	break;
    case '1':
    	if(mtoggle && status)
	{
	 mbleft = !mbleft;
	 mouse_down_up(dpy, 1, mbleft);
	}
	if(!mtoggle) mouse_down_up(dpy, 1, status);
	break;
    case '2':
    	if(mtoggle && status)
	{
	 mbmiddle = !mbmiddle;
	 mouse_down_up(dpy, 2, mbmiddle);
	}
	if(!mtoggle) mouse_down_up(dpy, 2, status);
	break;
    case '3':
    	if(mtoggle && status)
	{
	 mbright = !mbright;
	 mouse_down_up(dpy, 3, mbright);
	}
	if(!mtoggle) mouse_down_up(dpy, 3, status);
	break;
    case '*':
	if(status && !mtoggle) mouse_double_click(dpy);
	break;
    case '#':
	if(status)
	{
	 mtoggle = !mtoggle;
	 mbleft = mbright = mbmiddle = 0;
	}
	break;
   }
   if((key=='1' || key=='2' || key =='3') && !status
      && mtoggle && !mbleft && !mbmiddle && !mbright) mtoggle=0;
  }
  if(ret == -EINTR) mwait=MOUSE_RRATE;
  if(mup) mouse_rel_move(dpy, 0, -mdelta);
  if(mdown) mouse_rel_move(dpy, 0, mdelta);
  if(mright) mouse_rel_move(dpy, mdelta, 0);
  if(mleft) mouse_rel_move(dpy, -mdelta, 0);
 }
 
 writeport(cmd3, strlen(cmd3));
 if(waitfor("OK", 5, TIMEOUT) != 1) ret = -1;
 
 XCloseDisplay (dpy);
 return ret;
}

int refreshmenu()
{
 CONF *tconf = conf;
 conf = NULL;
 if(!init_cfg())
 {
  conf = tconf;
  return 0;
 }
 else
 {
  free(tconf);
  return 1;
 }
}

int keyboard()
{
 int ret=-1, go=1;
 char cmd1[]= "AT*EAID=1,1,\"Press the keys to simulate key presses on the computer\"\r";
 char cmd2[]= "AT+CMER=3,2,,,\r";
 char cmd3[]= "AT+CMER=0,0,,,\r";
 char buf[MAXLEN]="", *key;
 int status, keycnt;

 Display *dpy = XOpenDisplay (NULL);

 if(dpy==NULL) return -1;
 writeport(cmd1, strlen(cmd1));
 if(waitfor("OK", 1, TIMEOUT) != 1) go = 0;
 
 writeport(cmd2, strlen(cmd2));
 if(waitfor("OK", 1, TIMEOUT) != 1) go = 0;
 
 while(go)
 {
  buf[0]=0;
  ret = readport(buf, MAXLEN, TIMEOUT);
  if( (ret <= 0 && ret != -EINTR) || strncmp(buf, "ERROR", 5)==0 )
  {
   ret=-1;
   break;
  }
  if(strncmp(buf, "*EAII: ", 7)==0 || strncmp(buf, "*EAAI", 5)==0)
  {
   ret=1;
   break;
  }
  if(strncmp(buf, "+CKEV: ", 7)==0)
  {
   status=strchr(buf,',')[1]-'0';
   strchr(buf,',')[0]=0;

   key=buf+7;
   /* Correct for bug in T610 */
   if(key[0]==0x1B && key[1]==0x14)
   {
    key[0]='^';
    key[1]=0;
   }
   
   keycnt=0;
   while(keycnt < conf->keymapcnt && strcmp(conf->keymap[keycnt].name,key)) keycnt++;
   if(keycnt < conf->keymapcnt)
    key_down_up(dpy, conf->keymap[keycnt].val, status);
  }
 }
 
 writeport(cmd3, strlen(cmd3));
 if(waitfor("OK", 5, TIMEOUT) != 1) ret = -1;
 
 XCloseDisplay (dpy);
 return ret;
}
