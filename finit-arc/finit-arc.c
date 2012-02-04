#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <signal.h>
#include <unistd.h>
#include <sys/reboot.h>
#include <sys/wait.h>
#include <linux/fs.h>
#include <utmp.h>

#include "helpers.h"


/* From sysvinit */
/* Set a signal handler. */
#define SETSIG(sa, sig, fun, flags) \
		do { \
			sa.sa_handler = fun; \
			sa.sa_flags = flags; \
			sigemptyset(&sa.sa_mask); \
			sigaction(sig, &sa, NULL); \
		} while (0)



#define INIT_MAGIC		0x03091969
#define INIT_CMD_RUNLVL		1

struct init_request {
	int	magic;			/* Magic number                 */
	int	cmd;			/* What kind of request         */
	int	runlevel;		/* Runlevel to change to        */
	int	sleeptime;		/* Time between TERM and KILL   */
	char	data[368];
};


#define touch(x) mknod((x), S_IFREG|0644, 0)
#define chardev(x,m,maj,min) mknod((x), S_IFCHR|(m), makedev((maj),(min)))
#define blkdev(x,m,maj,min) mknod((x), S_IFBLK|(m), makedev((maj),(min)))

#define _d(x...) do { if (debug) { printf(x); printf("\n"); } } while (0)

#define LINE_SIZE 1024
#define CMD_SIZE 256
#define PARAMETER_SIZE 32
#define	KEYMAP_SIZE 8

void shutdown(int);
void signal_handler(int);
void chld_handler(int);
int getparam(char line[], char parola[], int prefisso, int suffisso);
static int debug = 0;


/* Standard reboot/shutdown utilities talk to init using /dev/initctl.
 * We should check if the fifo was recreated and reopen it.
 */
static void listen_initctl()
{
	if (!fork()) {	
		int ctl;	
		fd_set fds;	
		struct init_request request;

		mkfifo("/dev/initctl", 0600);
		ctl = open("/dev/initctl", O_RDONLY);

		while (1) {
			FD_ZERO(&fds);
			FD_SET(ctl, &fds);
			if (select(ctl + 1, &fds, NULL, NULL, NULL) <= 0)
				continue;

			read(ctl, &request, sizeof(request));

			if (request.magic != INIT_MAGIC)
				continue;

			if (request.cmd == INIT_CMD_RUNLVL) {
				switch (request.runlevel) {
				case '0':
					shutdown(SIGUSR2);
					break;
				case '6':
					shutdown(SIGUSR1);
				}
			}
		}
	}
}



int main()
{
	int i;
	FILE *f;
	char line[LINE_SIZE];
	char LET[LINE_SIZE];
	int SUMDEV = 0;
	struct sigaction sa, act;
	sigset_t nmask, nmask2;
	char hostname[PARAMETER_SIZE];
	char timezone[PARAMETER_SIZE];
	char modules[PARAMETER_SIZE];
	char *module;
	char keymap[KEYMAP_SIZE] = "us";
	char hardwareclock[PARAMETER_SIZE] = "localtime";
	char cmd[CMD_SIZE];

	//RUNLEVEL
	struct utmp entry;


	chdir("/");
	umask(022);
	
	/*
	 * Signal management
	 */
	for (i = 1; i < NSIG; i++)
		SETSIG(sa, i, SIG_IGN, SA_RESTART);

	SETSIG(sa, SIGINT,  shutdown, 0);
	SETSIG(sa, SIGPWR,  SIG_IGN, 0);
	SETSIG(sa, SIGUSR1, shutdown, 0);
	SETSIG(sa, SIGUSR2, shutdown, 0);
	SETSIG(sa, SIGTERM, SIG_IGN, 0);
	SETSIG(sa, SIGALRM, SIG_IGN, 0);
	SETSIG(sa, SIGHUP,  SIG_IGN, 0);
	SETSIG(sa, SIGCONT, SIG_IGN, SA_RESTART);
	SETSIG(sa, SIGCHLD, chld_handler, SA_RESTART);
	
	/* Block sigchild while forking */
	sigemptyset(&nmask);
	sigaddset(&nmask, SIGCHLD);
	sigprocmask(SIG_BLOCK, &nmask, NULL);

	reboot(RB_DISABLE_CAD);

	mount("none", "/proc", "proc", 0, NULL);

	/*
	 * Parse kernel parameters
	 */
	if ((f = fopen("/proc/cmdline", "r")) != NULL) {
		fgets(line, LINE_SIZE, f);
		if ((strstr(line, "finit_debug"))) {
			debug = 1;
		}
		if (strstr(line, "quiet")) {
			close(0);
			//close(1);
			close(2);
		}
		fclose(f);
	}

	// puts("finit-arc " VERSION " (built " __DATE__ " " __TIME__ " by " WHOAMI ")");

	puts("Finit-ARC - beta 0.2");
	setsid();

	mount("none", "/dev", "ramfs", 0, NULL);
	mount("none", "/sys", "sysfs", 0, NULL);
	mount("/mnt", "/", NULL, MS_MOVE, NULL);

	//mount("none", "/dev", "tmpfs", 0, "mode=0755");
	chardev("/dev/null", 0666, 1, 3);
	chmod("/dev/null", 0666);


	/*  Create basic device nodes. */
	if ((f = fopen("/etc/fstab", "r")) != NULL) {
		*line = 0;
		
		while (!feof(f)) {
			fgets(line, LINE_SIZE, f);
			
			if (getparam(line,"/dev/sd",0,0) == 0 )
			{
				SUMDEV = 0;
				*LET = 0;

				strcpy(LET,"/dev/sd");
				strncat(LET,line,2);
				
				if ((LET[7] == 'b'))
				SUMDEV = 16;
				if ((LET[7] == 'c'))
				SUMDEV = 32;
				if ((LET[7] == 'd'))
				SUMDEV = 64;
				
				blkdev(LET, 0660, 8, ((atoi(&LET[8]))+SUMDEV));
				//printf("%s, 0660, 8, %d\n",LET,((atoi(&LET[8]))+SUMDEV));
			}
			if (getparam(line,"/dev/mmcblk0p",0,0) == 0 )
			{
				strcpy(LET,"/dev/mmcblk0p");
				strncat(LET,line,1);
				
				blkdev(LET, 0660, 179, ((atoi(&LET[13]))));
				//printf("%s, 0660, 179, %d\n",LET,((atoi(&LET[13]))));
			}
		}
		fclose(f);
	}



	/*
	 * Parse configuration file
	 */
	if ((f = fopen("/etc/rc.conf", "r")) != NULL) {
		while (!feof(f)) {
			fgets(line, LINE_SIZE, f);

			if (getparam(line,"HARDWARECLOCK",2,1) == 0 ) {
				*hardwareclock = 0;
				strcpy(hardwareclock,line);
				continue;
			}
			if (getparam(line,"KEYMAP",2,1) == 0 ) {
				*keymap = 0;
				strcpy(keymap,line);
				continue;
			}
			if (getparam(line,"HOSTNAME",2,1) == 0 ) {
				*hostname = 0;
				strcpy(hostname,line);
				continue;
			}
			if (getparam(line,"TIMEZONE",2,1) == 0 ) {
				*timezone = 0;
				strcpy(timezone,line);
				continue;
			}
			if (getparam(line,"MODULES",2,1) == 0 ) {
				*modules = 0;
				strcpy(modules,line);
			
				if((strlen(modules)) > 0)
				{
					if ((strstr(modules," ")) )
					{
						module = strtok(modules, " ");
						while (module != NULL)
						{
							strcpy(cmd,"/sbin/modprobe ");
							if (!(strstr(module,"!")))
							{
								strcat(cmd,module);
								system(cmd);
							}		
						module = strtok(NULL, " ");
						}
					} else {
						if (!(strstr(modules,"!")))
						{
							strcpy(cmd,"/sbin/modprobe ");
							strcat(cmd,modules);
							system(cmd);
						}
					}
				}
				continue;
			}
		}
		fclose(f);
	}


	/*
	 * Set hwclock for fscheck
	*/
	strcpy(cmd, "/sbin/hwclock --hctosys --");
	if(((strcmp(hardwareclock,"UTC")) == 0))
		strcpy(hardwareclock,"utc");
	strcat(cmd,hardwareclock);
	system(cmd);
	//strcpy(SETCLOCK,cmd); 



	/*
	 * Make standard devices
	 */
	chardev("/dev/console", 0666, 5, 1);
	chardev("/dev/urandom", 0666, 1, 9);
	chardev("/dev/ptmx", 0666, 5, 2);
	chardev("/dev/mem",  0640, 1, 1);
	blkdev("/dev/loop0",  0600, 7, 0);
	chardev("/dev/tty", 0666, 5, 0);
	chardev("/dev/tty0", 0660, 4, 0);
	chardev("/dev/tty1", 0660, 4, 1);
	chardev("/dev/tty2", 0660, 4, 2);
	chardev("/dev/tty3", 0660, 4, 3);
	mkdir("/dev/vc", 0755);
	chardev("/dev/vc/0", 0660, 4, 0);
	chardev("/dev/vc/1", 0660, 4, 1);
	chardev("/dev/vc/2", 0660, 4, 2);
	chardev("/dev/vc/3", 0660, 4, 3);
	mkdir("/dev/input", 0755);
	chardev("/dev/input/mice",  0660, 13, 63);
	chardev("/dev/input/event0",  0660, 13, 64);




	system("/bin/mount -n -o remount,ro /");

	/*
	 * Filesystem check
	 */
	system("/sbin/fsck -A -T -C -a");


	/*
	 * Remount root filesystems
	 */
	mkdir("/dev/shm", 0755);
	mkdir("/dev/pts", 0755);
	system("/bin/mount -n -o remount,rw /");
	umask(0);


	/*
	 * Mount local partitions
	 */
	unlink("/etc/mtab");
	//system("/bin/grep -e '/proc ' -e '/sys ' -e '/dev ' /proc/mounts >> /etc/mtab");
	system("mount -a");
	umask(0022);


	/*
	 * Set global path var
	 */
	setenv("PATH","/bin:/usr/bin:/sbin:/usr/sbin:/usr/bin/perlbin/site:/usr/bin/perlbin/vendor:/usr/bin/perlbin/core",1);


	/*
	 * Time adjustments
	 
	if ((fd = open("/etc/adjtime", O_CREAT|O_WRONLY|O_TRUNC, 0644)) >= 0) {
		write(fd, "0.0 0 0.0\n", 10);
		close(fd);
	}
		if((strcmp(hardwareclock,"localtime")) == 0)
	{
	strcpy(cmd, "/bin/cp /usr/share/zoneinfo/");
	strcpy(cmd, timezone);
	build_cmd(cmd, " /etc/localtime", CMD_SIZE);
	puts(cmd);
	system(cmd);
	}
	system("/sbin/hwclock --adjust");
	strcpy(cmd,SETCLOCK);
	strcat(cmd, " &");
	system(cmd);
	*/
	

	/*
	 * Network stuff
	 */
	system("/sbin/ifconfig lo 127.0.0.1 up &");


	/* RUNLEVEL */
	memset(&entry, 0, sizeof(struct utmp));
	entry.ut_type = RUN_LVL;
	entry.ut_pid = '0' + 5;
	setutent();
	pututline(&entry);
	endutent();


	/*
	 * Set random seed
	 */
	copyfile("/var/lib/random-seed", "/dev/urandom", 0);
	unlink("/var/lib/random-seed");
	umask(077);
	copyfile("/dev/urandom", "/var/lib/random-seed", 4096);
	umask(0);



	/*
	 * Set hostname
	 */
	sethostname(hostname, strlen(hostname));


	/*
	 * Set Keymap
	 */
	strcpy(cmd, "/bin/loadkeys ");
	strcat(cmd, keymap);
	strcat(cmd, " &>/dev/null &");
	system(cmd);


	/*
	 * Start getty terminal
	 */
	system("/sbin/agetty -8 38400 vc/1 linux &"); 
	system("/sbin/agetty -8 38400 vc/2 linux &");	


	/*
	 * Leftover files
	 */
	mount("none", "/var/lock", "tmpfs", 0, "mode=1777");
	mount("none", "/tmp", "tmpfs", 0, "mode=1777,size=128m");
	touch("/var/run/utmp");
	chown("/var/run/utmp", 0, getgroup("utmp"));
	chmod("/var/run/utmp", 0664);


	/*
	 * Misc setup
	 */
	mkdir("/tmp/.X11-unix", 01777);
	mkdir("/tmp/.ICE-unix", 01777);
	umask(022);
	
		
	if (!fork()) {
		/* child process */
		vhangup();

		close(2);
		close(1);
		close(0);

		if (open("/dev/tty1", O_RDWR) != 0)
			exit(1);

		sigemptyset(&act.sa_mask);
		act.sa_handler = SIG_DFL;

		sigemptyset(&nmask2);
		sigaddset(&nmask2, SIGCHLD);
		sigprocmask(SIG_UNBLOCK, &nmask2, NULL);

		for (i = 1; i < NSIG; i++)
			sigaction(i, &sa, NULL);

		dup2(0, 0);
		dup2(0, 1);
		dup2(0, 2);
		

		/* Listen initctl */
		listen_initctl();

		
		/* Prevents bash from running loadkeys */
		unsetenv("TERM");


		/* ConsoleKit needs this */
		setenv("DISPLAY", ":0.0", 1);
		

		/* Get action from /etc/finittab*/
		if ((f = fopen("/etc/finittab", "r")) != NULL) {
			while (!feof(f)) {
				fgets(line, LINE_SIZE, f);
				
				if (getparam(line,"level:",0,0) == 0 )
				{
				strcat(line," &");
				system(line);
				}
				continue;
			}
		}
		
		
		exit(0);
	}
	
	
	/* parent process */
	system("/usr/sbin/start-services.sh &>/dev/null &");


	while (1) {
		sigemptyset(&nmask);
		pselect(0, NULL, NULL, NULL, NULL, &nmask);
	}
}


/*
 * Shut down on INT USR1 USR2
 */
void shutdown(int sig)
{

	system("/usr/sbin/stop-services.sh > /dev/null");
	touch("/tmp/shutdown");

	kill(-1, SIGTERM);

	write(1, "\033[?25l\033[30;40m", 14);
	sleep(2);

	system("/usr/sbin/alsactl store > /dev/null 2>&1");
	system("/sbin/hwclock --systohc --localtime");

	kill(-1, SIGKILL);

	sync();
	sync();
	system("/bin/umount -a;/bin/mount -n -o remount,ro /");
	//system("/sbin/unionctl.static / --remove / > /dev/null 2>&1");

	if (sig == SIGINT || sig == SIGUSR1)
		reboot(RB_AUTOBOOT);

	reboot(RB_POWER_OFF);
}


/*
 * SIGCHLD: one of our children has died
 */
void chld_handler(int sig)
{
	int status;

	while (waitpid(-1, &status, WNOHANG) != 0) {
		if (errno == ECHILD)
			break;
	}
}

int getparam(char line[], char parola[], int prefisso, int suffisso)
{
int present = 1;
	if ((strstr(line,parola)) && ((strncmp(parola,line,(strlen(parola)))) == 0))
	{
	strncpy(line,&line[(strlen(parola))+prefisso],(strlen(line)));
	line[((strlen(line))-(suffisso+1))]='\0';
	present = 0;
	}
	
	return(present);
}
