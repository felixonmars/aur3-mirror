/*
 * (C) 2011 by Christian Hesse <mail@eworm.de>
 *
 * This software may be used and distributed according to the terms
 * of the GNU General Public License, incorporated herein by reference.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <libnotify/notify.h>

#include <libudev.h>

int main (int argc, char ** argv) {
	struct udev * udev;
	struct udev_device * dev;
   	struct udev_monitor * mon = NULL;
	fd_set readfds;
	int fdcount;

	char notification [50];
	char icon [20];
        NotifyNotification * netlink;

	GError * error = NULL;

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
				switch(udev_device_get_action(dev)[0]) {
					case 'a':
						// a: add
						sprintf(notification, "Device %s appeared.", udev_device_get_sysname(dev));
						sprintf(icon, "network-wired");
						break;
					case 'r':
						// r: remove
						sprintf(notification, "Device %s disappeared.", udev_device_get_sysname(dev));
						sprintf(icon, "network-offline");
						break;
					case 'm':
						// m: move
						sprintf(notification, "Device %s was renamed.", udev_device_get_sysname(dev));
						sprintf(icon, "dialog-information");
						break;
					case 'c':
						// c: change
						sprintf(notification, "Anything for device %s changed.", udev_device_get_sysname(dev));
						sprintf(icon, "dialog-warning");
						break;
					default:
						sprintf(notification, "Anything happend to %s... Don't know.", udev_device_get_sysname(dev));
						sprintf(icon, "dialog-warning");
				}
				printf("%s: %s\n", argv[0], notification);
				netlink = notify_notification_new("Udev-Net", notification, icon);
	
			        notify_notification_set_timeout(netlink, 5000);
				notify_notification_set_category(netlink, "Udev-Net");
				notify_notification_set_urgency (netlink, NOTIFY_URGENCY_NORMAL);
	
				while(!notify_notification_show(netlink, &error)) {
					g_printerr("%s: Error \"%s\" while trying to show notification. Trying to reconnect.\n", argv[0], error->message);
					g_error_free(error);
					error = NULL;
	
					notify_uninit();
					if(!notify_init("Udev-Net-Notification")) {
						fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
						exit(EXIT_FAILURE);
					}
				}
	
				udev_device_unref(dev);
			}
	
			// This is not really needed... But we want to make shure not to eat 100% CPU if anything breaks. ;)
			usleep(500 * 1000);
		}
	}

	udev_unref(udev);
	return EXIT_SUCCESS;
}
