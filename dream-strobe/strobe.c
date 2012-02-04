/* strobe.c (<~Harvie 2oo9)
 * Dream Machine implementation for GNU/Linux
 * usage ./strobe [frequency]
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

void signal_handler(int signo) {
	if(signo == SIGTERM || signo == SIGINT || signo == SIGQUIT) {
		fputs("\033[0m" "\033[2J" "\033[0;0H", stdout); fflush(stdout); //restore default terminal settings
		exit(0);
	}
}

int main(int argc, char *argv[]) {
	//Settings
	char bg_black[]		= "\033[40m\033[1;37m"; //set black background
	char bg_white[]		= "\033[47m\033[1;30m"; //set white background
	char cls[]				= "\033[2J" "\033[0;0H"; //clear screen and return to begining of it
	char format_str[]	= "%s%s" //"\033[40m\033[1;37m"
		"Warning: this software can cause seizures. Use it on your own risk only! Don't forget to close your eyes! Running at %g Hz (Press ^C to exit)";
	double frequency = 10; //Hz

	//Compute intervals
	int cache_size = 0;
	if(argc > 1) {
		frequency = strtod(argv[1], NULL); //get frequency from argv[1] (if present)
		cache_size += sizeof(argv[1]);
	}
	useconds_t half_interval = (1000000/frequency)/2; //uSeconds

	//Pre-cache output strings
	cache_size += sizeof(bg_black) + sizeof(cls) + sizeof(format_str) + 5;
	char state_a[cache_size];
	char state_b[cache_size];

	sprintf(state_a, format_str, bg_black, cls, frequency);
	sprintf(state_b, format_str, bg_white, cls, frequency);

	//Register signals
	signal(SIGINT, signal_handler); signal(SIGTERM, signal_handler); signal(SIGQUIT, signal_handler);

	//Main loop
	while(1) {
		fputs(state_a, stdout);
			fflush(stdout);
			usleep(half_interval);
		fputs(state_b, stdout);
			fflush(stdout);
			usleep(half_interval);
	}
}
