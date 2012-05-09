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
#include <blkid.h>

#define NOTIFICATION_TIMEOUT	10000

#define ICON_ADD	"media-flash"
#define ICON_REMOVE	"media-flash"
#define ICON_MOVE	"media-flash"
#define ICON_CHANGE	"media-flash"
#define ICON_DEFAULT	"media-flash"

#define TEXT_ADD	"Device <b>%s</b> (%i:%i) <b>appeared</b>."
#define TEXT_REMOVE	"Device <b>%s</b> (%i:%i) <b>disappeared</b>."
#define TEXT_MOVE	"Device <b>%s</b> (%i:%i) was <b>renamed</b>."
#define TEXT_CHANGE	"Device <b>%s</b> (%i:%i) media <b>changed</b>."
#define TEXT_DEFAULT	"Anything happend to <b>%s</b> (%i:%i)... Don't know."
#define TEXT_TAG	"%s\n%s: <i>%s</i>"

int main (int argc, char ** argv) {
	struct udev * udev;
	struct udev_device * dev;
	char * device = NULL;
   	struct udev_monitor * mon = NULL;
	fd_set readfds;
	int fdcount, devnum, errcount = 0;
	unsigned short int i, major, minor;
	short int * maxminor;

	char * notification = NULL;
	char * icon = NULL;
        NotifyNotification * netlink;
        NotifyNotification *** netlinkref;

	blkid_cache cache = NULL;
	char *read = NULL;
	blkid_tag_iterate iter;
	const char *type, *value, *devname;
	blkid_dev blkdev;

	GError * error = NULL;

	printf("%s: %s v%s (compiled: %s)\n", argv[0], PROGNAME, VERSION, DATE);

	if(!notify_init("Udev-Block-Notification")) {
		fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	udev = udev_new();
	if(!udev) {
		fprintf(stderr, "%s: Can't create udev.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	mon = udev_monitor_new_from_netlink(udev, "udev");
	udev_monitor_filter_add_match_subsystem_devtype(mon, "block", NULL);
	udev_monitor_enable_receiving(mon);

	netlinkref = malloc(256 * sizeof(size_t));
	for(i = 0; i < 256; i++)
		netlinkref[i] = NULL;
	maxminor = malloc(256 * sizeof(short int));
	for(i = 0; i < 256; i++)
		maxminor[i] = -1;

	while (1) {
                FD_ZERO(&readfds);
                if (mon != NULL)
                        FD_SET(udev_monitor_get_fd(mon), &readfds);

                fdcount = select(udev_monitor_get_fd(mon) + 1, &readfds, NULL, NULL, NULL);

                if ((mon != NULL) && FD_ISSET(udev_monitor_get_fd(mon), &readfds)) {
			dev = udev_monitor_receive_device(mon);
			if(dev) {
				device = (char *) udev_device_get_sysname(dev);
				devnum = udev_device_get_devnum(dev);
				major = devnum / 256;
				minor = devnum - (major * 256);

				switch(udev_device_get_action(dev)[0]) {
					case 'a':
						// a: add
						notification = (char *) malloc(strlen(TEXT_ADD) + strlen(device));
						sprintf(notification, TEXT_ADD, device, major, minor);
						icon = ICON_ADD;
						break;
					case 'r':
						// r: remove
						notification = (char *) malloc(strlen(TEXT_REMOVE) + strlen(device));
						sprintf(notification, TEXT_REMOVE, device, major, minor);
						icon = ICON_REMOVE;
						break;
					case 'm':
						// m: move
						notification = (char *) malloc(strlen(TEXT_MOVE) + strlen(device));
						sprintf(notification, TEXT_MOVE, device, major, minor);
						icon = ICON_MOVE;
						break;
					case 'c':
						// c: change
						notification = (char *) malloc(strlen(TEXT_CHANGE) + strlen(device));
						sprintf(notification, TEXT_CHANGE, device, major, minor);
						icon = ICON_CHANGE;
						break;
					default:
						// we should never get here I think...
						notification = (char *) malloc(strlen(TEXT_DEFAULT) + strlen(device));
						sprintf(notification, TEXT_CHANGE, device, major, minor);
						icon = ICON_DEFAULT;
				}

				blkid_get_cache(&cache, read);
				blkdev = blkid_get_dev(cache, udev_device_get_devnode(dev), BLKID_DEV_NORMAL);
			
				if (blkdev) {
					iter = blkid_tag_iterate_begin(blkdev);
			
					while (blkid_tag_next(iter, &type, &value) == 0) {
						notification = (char *) realloc(notification, strlen(TEXT_TAG) + strlen(notification) + strlen(type) + strlen(value));
						sprintf(notification, TEXT_TAG, notification, type, value);
					}

					blkid_tag_iterate_end(iter);
					blkid_put_cache(cache);
				}

				printf("%s: %s\n", argv[0], notification);

				if (maxminor[major] < minor) {
					netlinkref[major] = realloc(netlinkref[major], (minor + 1) * sizeof(size_t));
			                while(maxminor[major] < minor)
			                        netlinkref[major][++maxminor[major]] = NULL;
			        }
					
				if (netlinkref[major][minor] == NULL) {
					netlink = notify_notification_new("Udev-Block", notification, icon);
					netlinkref[major][minor] = netlink;
				} else {
					netlink = netlinkref[major][minor];
					notify_notification_update(netlink, "Udev-Block", notification, icon);
				}

			        notify_notification_set_timeout(netlink, NOTIFICATION_TIMEOUT);
				notify_notification_set_category(netlink, "Udev-Block");
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

						if(!notify_init("Udev-Block-Notification")) {
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
