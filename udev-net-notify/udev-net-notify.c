/*
 * (C) 2011-2012 by Christian Hesse <mail@eworm.de>
 *
 * This software may be used and distributed according to the terms
 * of the GNU General Public License, incorporated herein by reference.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include <libnotify/notify.h>
#include <libudev.h>

#define NOTIFICATION_TIMEOUT	10000

#define ICON_ADD	"network-wired"
#define ICON_REMOVE	"network-offline"
#define ICON_MOVE	"dialog-information"
#define ICON_CHANGE	"dialog-warning"
#define ICON_DEFAULT	"dialog-warning"

#define TEXT_ADD	"Device <b>%s appeared</b>."
#define TEXT_REMOVE	"Device <b>%s disappeared</b>."
#define TEXT_MOVE	"Device <b>%s</b> was <b>renamed</b>."
#define TEXT_CHANGE	"Anything for device %s changed."
#define TEXT_DEFAULT	"Anything happend to %s... Don't know."


int main (int argc, char ** argv) {
	struct udev * udev;
	struct udev_device * dev;
	char * device = NULL;
   	struct udev_monitor * mon = NULL;
	fd_set readfds;
	int fdcount, errcount = 0;

	char * notification = NULL;
	char * icon = NULL;
        NotifyNotification * netlink;

	GError * error = NULL;

	printf("%s: %s v%s (compiled: %s)\n", argv[0], PROGNAME, VERSION, DATE);

	if(!notify_init("Udev-Net-Notification")) {
		fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	udev = udev_new();
	if(!udev) {
		fprintf(stderr, "%s: Can't create udev.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	mon = udev_monitor_new_from_netlink(udev, "udev");
	udev_monitor_filter_add_match_subsystem_devtype(mon, "net", NULL);
	udev_monitor_enable_receiving(mon);

	while (1) {
                FD_ZERO(&readfds);
                if (mon != NULL)
                        FD_SET(udev_monitor_get_fd(mon), &readfds);

                fdcount = select(udev_monitor_get_fd(mon) + 1, &readfds, NULL, NULL, NULL);

                if ((mon != NULL) && FD_ISSET(udev_monitor_get_fd(mon), &readfds)) {
			dev = udev_monitor_receive_device(mon);
			if(dev) {
				device = (char *) udev_device_get_sysname(dev);

				switch(udev_device_get_action(dev)[0]) {
					case 'a':
						// a: add
						notification = (char *) malloc(strlen(TEXT_ADD) + strlen(device));
						sprintf(notification, TEXT_ADD, device);
						icon = ICON_ADD;
						break;
					case 'r':
						// r: remove
						notification = (char *) malloc(strlen(TEXT_REMOVE) + strlen(device));
						sprintf(notification, TEXT_REMOVE, device);
						icon = ICON_REMOVE;
						break;
					case 'm':
						// m: move
						notification = (char *) malloc(strlen(TEXT_MOVE) + strlen(device));
						sprintf(notification, TEXT_MOVE, device);
						icon = ICON_MOVE;
						break;
					case 'c':
						// c: change
						notification = (char *) malloc(strlen(TEXT_CHANGE) + strlen(device));
						sprintf(notification, TEXT_CHANGE, device);
						icon = ICON_CHANGE;
						break;
					default:
						// we should never get here I think...
						notification = (char *) malloc(strlen(TEXT_DEFAULT) + strlen(device));
						sprintf(notification, TEXT_DEFAULT, device);
						icon = ICON_DEFAULT;
				}
				printf("%s: %s\n", argv[0], notification);
				netlink = notify_notification_new("Udev-Net", notification, icon);
	
			        notify_notification_set_timeout(netlink, NOTIFICATION_TIMEOUT);
				notify_notification_set_category(netlink, "Udev-Net");
				notify_notification_set_urgency (netlink, NOTIFY_URGENCY_NORMAL);
	
				while(!notify_notification_show(netlink, &error)) {
					if (errcount > 1) {
						fprintf(stderr, "%s: Looks like we can not reconnect to notification daemon... Exiting.\n", argv[0]);
						exit(EXIT_FAILURE);
					} else {
						g_printerr("%s: Error \"%s\" while trying to show notification. Trying to reconnect.\n", argv[0], error->message);
						errcount++;
						
						g_error_free(error);
						error = NULL;
	
						notify_uninit();

						usleep(500 * 1000);

						if(!notify_init("Udev-Net-Notification")) {
							fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
							exit(EXIT_FAILURE);
						}
					}
				}
				errcount = 0;
	
				free(notification);
				udev_device_unref(dev);
			}
	
			// This is not really needed... But we want to make shure not to eat 100% CPU if anything breaks. ;)
			usleep(500 * 1000);
		}
	}

	udev_unref(udev);
	return EXIT_SUCCESS;
}
