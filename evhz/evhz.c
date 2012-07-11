/**************************************************
 This program was written by Alan 'Strider' Kivlin.
***************************************************/

#include <stdio.h>
#include <string.h>
#include <linux/input.h>
#include <fcntl.h>
#include <signal.h>

#define EVENTS 10
#define HZ_LIST 64

typedef struct event_s {
	int fd;
	int hz[HZ_LIST];
	int count;
	double prvtime;
} event_t;

int quit = 0;

void sigint() {
	signal(SIGINT, sigint);
	quit = 1;
}

int main(int argc, char **argv) {
	int i;
	event_t events[EVENTS];

	signal(SIGINT, sigint);

	printf("Press CTRL-C to exit.\n\n");

	memset(events, 0, sizeof(events));

	for(i = 0; i < EVENTS; i++) {
		char device[18];

		sprintf(device, "/dev/input/event%i", i);
		events[i].fd = open(device, O_RDONLY);
		
		if(events[i].fd != -1) {
			char name[128];
			ioctl(events[i].fd, EVIOCGNAME(sizeof(name)), name);
			printf("event%i: %s\n", i, name);
		}
	}

	while(!quit) {
		fd_set set;

		FD_ZERO(&set);

		for(i = 0; i < EVENTS; i++) {
			if(events[i].fd != -1) {
				FD_SET(events[i].fd, &set);
			}
		}

		if(select(FD_SETSIZE, &set, NULL, NULL, NULL) > 0) {
			int bytes;
			struct input_event event;

			for(i = 0; i < EVENTS; i++) {
				if(events[i].fd == -1) {
					continue;
				}

				if(!FD_ISSET(events[i].fd, &set)) {
					continue;
				}

				bytes = read(events[i].fd, &event, sizeof(event));

				if(bytes != sizeof(event)) {
					continue;
				}

				if(event.type == EV_REL) {
					double time;
					int hz;

					time = event.time.tv_sec * 1000 + event.time.tv_usec / 1000;
					hz = 1000 / (time - events[i].prvtime);

					if(hz > 0) {
						int avghz;
						int j;

						events[i].count++;
						events[i].hz[events[i].count & (HZ_LIST - 1)] = hz;

						avghz = 0;

						for(j = 0; j < HZ_LIST; j++) {
							avghz += events[i].hz[j];
						}

						avghz /= (events[i].count > HZ_LIST) ? HZ_LIST : events[i].count;

						printf("event%i: latest hz = %i (average hz = %i)\n", i, hz, avghz);
					}

					events[i].prvtime = time;
				}
			}
		}
	}

	for(i = 0; i < EVENTS; i++) {
		if(events[i].fd != -1) {
			close(events[i].fd);
		}
	}
}
