//cmp-daemon	V 0.21

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <time.h>
#include <signal.h>
#include <string.h>
#include <syslog.h>

#define CPUINFO "/proc/cpuinfo"
#define PIDFILE "/var/run/cmp-daemon.pid"

#define FAN_1_MANUAL "/sys/devices/platform/applesmc.768/fan1_manual"

#define RD_CPU_1_TEMP "/sys/devices/platform/coretemp.0/temp2_input"
#define RD_CPU_2_TEMP "/sys/devices/platform/coretemp.0/temp3_input"

#define RD_FAN_1 "/sys/devices/platform/applesmc.768/fan1_input"
#define WR_FAN_1 "/sys/devices/platform/applesmc.768/fan1_output"

#define MIN_SPEED 2000
#define MAX_SPEED 5700

#define ERROR -1
#define OK 0

int read_cpu_1_temp(void);
int read_cpu_2_temp(void);
void write_fan_1_manual(int);
void write_fan_1_speed(int);
void write_pidfile(void);
void check_pidfile(void);
void check_cpu(void);
int log_fan_speed(int,int,int);
int set_min_max_fan_speed(int);


void Signal_Handler(int sig){
	switch(sig){
		case SIGHUP:
			break;		
		case SIGTERM:
			write_fan_1_manual(0);
			unlink(PIDFILE);
			syslog(LOG_INFO, "Stop");
			closelog();
			exit(OK);
			break;		
		}	
}


void start_daemon(void){
	int i=0;
	pid_t pid;
	pid=fork();

	if (pid<0){ 
		/* fork error */
		syslog(LOG_ERR,"Error cannot fork");
		closelog();
		exit(ERROR);
	}

	else if (pid>0){
		exit(OK);
		/* child continues */
	}

	if(setsid() == ERROR){
		syslog(LOG_ERR,"Error setsid");
		closelog();
		exit(ERROR);
	}

	for (i=getdtablesize();i>=0;--i) close(i); 
	umask(027);
	chdir ("/");
}


int main(int argc, char **argv){

	signal(SIGHUP,Signal_Handler);		/* hangup signal */
	signal(SIGTERM,Signal_Handler);		/* software termination signal from kill */

	struct timespec timx,tim1;

	openlog("cmp-daemon", LOG_PID, LOG_DAEMON);

	/* check machine and pidfile*/
	check_cpu();
	check_pidfile();
	write_pidfile();
	write_fan_1_manual(1);

	start_daemon();

	tim1.tv_sec = 0;
	tim1.tv_nsec = 550000000;

	//init
	int cold=2;
	int hot=2;
	int wr_manual=0;
	int change_number=0;
	int old_fan_speed=-1;

	syslog(LOG_INFO,"Start");

	int rd_cpu_1_temp=read_cpu_1_temp();
	int rd_cpu_2_temp=read_cpu_2_temp();
	int temp=(rd_cpu_1_temp + rd_cpu_2_temp)/2000;
	int old_temp=(rd_cpu_1_temp + rd_cpu_2_temp)/2000;
	int fan_speed=(temp-38)*160;

	write_fan_1_manual(1);
	fan_speed=set_min_max_fan_speed(fan_speed);
	write_fan_1_speed(fan_speed);

	while(1){

		rd_cpu_1_temp = read_cpu_1_temp();
		rd_cpu_2_temp = read_cpu_2_temp();

		wr_manual++;

		if (wr_manual==9){
			write_fan_1_manual(1);
			wr_manual=0;
		}

		temp=(rd_cpu_1_temp+rd_cpu_2_temp)/2000;

		if (temp<old_temp){
			cold++;
			hot=0;
		}
		if (temp>old_temp){
			hot++;
			cold=0;
		}

		if ((cold==3)||(hot==3)){
			//	temp = average of both cpu's
			fan_speed=(temp-38)*160;
			//	(50 - 38) * 160 = 1920
			//	(60 - 38) * 160 = 3520
			//	(70 - 38) * 160 = 5120
			fan_speed=set_min_max_fan_speed(fan_speed);

			if (fan_speed!=old_fan_speed){
				write_fan_1_speed(fan_speed);
				change_number=log_fan_speed(fan_speed,change_number,temp);
				old_fan_speed=fan_speed;
			}

			cold=0;
			hot=0;
		}

		old_temp=temp;

		if (nanosleep(&tim1,&timx)<OK){
			closelog();
			exit(ERROR);
		}
	}
}


int read_cpu_1_temp(void){
	int temp;
	FILE *file;

	if ((file=fopen(RD_CPU_1_TEMP,"r"))!=NULL){
		fscanf(file,"%d",&temp);
		fclose(file);
		return temp;
	}
	else{
		syslog(LOG_ERR,"Error read_cpu_1_temp");
		unlink(PIDFILE);
		closelog();
		exit(ERROR);
	}
}


int read_cpu_2_temp(void){
	int temp;
	FILE *file;

	if ((file=fopen(RD_CPU_2_TEMP,"r"))!=NULL){
		fscanf(file,"%d", &temp);
		fclose(file);
		return temp;
	}
	else {
		syslog(LOG_ERR,"Error read_cpu_2_temp");
		unlink(PIDFILE);
		closelog();
		exit(ERROR);
	}
}

int set_min_max_fan_speed(int fan_speed){

	if (fan_speed<MIN_SPEED){
		fan_speed=MIN_SPEED;
	}
	if (fan_speed>MAX_SPEED){
		fan_speed=MAX_SPEED;
	}

	return fan_speed;
}

void write_fan_1_speed(int fan_speed_1){
	FILE *file;

	if((file=fopen(WR_FAN_1, "w"))!=NULL){
		fprintf(file,"%d",fan_speed_1);
		fclose(file);
	}
	else{
		syslog(LOG_ERR, "Error write_fan_1_speed, applesmc loaded?");
		unlink(PIDFILE);
		closelog();
		exit(ERROR);
	}
}



int log_fan_speed(int fan_speed,int change_number,int temp){
	change_number++;
	syslog(LOG_INFO, "Change %d: fan speed %d RPM temperature %d degree celsius",change_number,fan_speed,temp);
	return change_number;
}


void write_fan_1_manual(int fan_manual_1){
	FILE *file;
	if((file=fopen(FAN_1_MANUAL, "w"))!=NULL){
		fprintf(file,"%d",fan_manual_1);
		fclose(file);
	}
	else{
		syslog(LOG_ERR, "Error write_fan_1_manual, applesmc loaded?");
		unlink(PIDFILE);
		closelog();
		exit(ERROR);
	}
}



void write_pidfile(){
	FILE *file;
	if((file=fopen(PIDFILE,"w"))!=NULL){
		fprintf(file,"%d",getpid());
		fclose(file);
	}
	else{
		syslog(LOG_ERR, "Error write_pidfile");
		closelog();
		exit(ERROR);
	}
}


void check_pidfile(){
	FILE *file;
	if((file=fopen(PIDFILE,"r"))!=NULL){
		/* if PIDFILE exist */
		fclose(file);
		syslog(LOG_ERR,"Error check_pidfile");
		closelog();
		exit(ERROR);
	}
}


void check_cpu(){
	FILE *file;
	char buffer[80];
	int cpucount=0;

	if((file=fopen(CPUINFO,"r"))!=NULL){
		while (!feof(file)) {
			fgets(buffer, sizeof(buffer),file);
			if (!strncmp(buffer,"model name	: Intel(R) Core(TM)2 Duo CPU",39)){
				cpucount++;
				if (cpucount==1){
					syslog(LOG_INFO,"CPU: %s",buffer);
				}
			}
		}
		fclose(file);
	}	
	else{
		syslog(LOG_ERR,"Error check_cpu");
		closelog();
		exit(ERROR);
	}

	if (cpucount!=2){
		syslog(LOG_ERR,"Error check_cpu count: %d",cpucount);
		closelog();
		exit(ERROR);
	}
}
