/*
 * (C) 2011 by Christian Hesse <mail@eworm.de>
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

#define TEXT_ADD	"<b>Device %s appeared</b>.\nlabel: %s\nuuid: %s\ntype: %s"
#define TEXT_REMOVE	"<b>Device %s disappeared</b>."
#define TEXT_MOVE	"<b>Device %s was renamed</b>.\nlabel: %s\nuuid: %s\ntype: %s"
#define TEXT_CHANGE	"<b>Device %s media changed</b>.\nlabel: %s\nuuid: %s\ntype: %s"
#define TEXT_DEFAULT	"<b>Anything happend to %s...</b> Don't know.\nlabel: %s\nuuid: %s\ntype: %s"

#define TEXT_NONE	"<i>none</i>"

int main (int argc, char ** argv) {
	struct udev * udev;
	struct udev_device * dev;
	char * device = NULL;
   	struct udev_monitor * mon = NULL;
	fd_set readfds;
	int fdcount;

	char * notification = NULL;
	char * icon = NULL;
        NotifyNotification * netlink;

	blkid_cache cache = NULL;
	char *read = NULL;
	blkid_tag_iterate iter;
	const char *type, *value, *devname;
	char *devfile;
	blkid_dev blkdev;
	const char *fstype, *label, *uuid;

	GError * error = NULL;

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

	while (1) {
                FD_ZERO(&readfds);
                if (mon != NULL)
                        FD_SET(udev_monitor_get_fd(mon), &readfds);

                fdcount = select(udev_monitor_get_fd(mon) + 1, &readfds, NULL, NULL, NULL);

                if ((mon != NULL) && FD_ISSET(udev_monitor_get_fd(mon), &readfds)) {
			dev = udev_monitor_receive_device(mon);
			if(dev) {
				label = NULL;
				fstype = NULL;
				uuid = NULL;

				device = (char *) udev_device_get_sysname(dev);

				devfile = (char *) malloc(6 + strlen(device));
				sprintf(devfile, "/dev/%s", device);

				blkid_get_cache(&cache, read);
				blkdev = blkid_get_dev(cache, devfile, BLKID_DEV_NORMAL);
				free(devfile);
			
				if (blkdev) {
					iter = blkid_tag_iterate_begin(blkdev);
			
					while (blkid_tag_next(iter, &type, &value) == 0) {
						if (!strcmp(type, "UUID"))
							uuid = value;
						if (!strcmp(type, "TYPE"))
							fstype = value;
						if (!strcmp(type, "LABEL"))
							label = value;
					}
				}

				if (uuid == NULL)
					uuid = TEXT_NONE;
				if (fstype == NULL)
					fstype = TEXT_NONE;
				if (label == NULL)
					label = TEXT_NONE;
			
				switch(udev_device_get_action(dev)[0]) {
					case 'a':
						// a: add
						notification = (char *) malloc(strlen(TEXT_ADD) + strlen(device) + strlen(label) + strlen(uuid) + strlen(fstype));
						sprintf(notification, TEXT_ADD, device, label, uuid, fstype);
						icon = ICON_ADD;
						break;
					case 'r':
						// r: remove
						notification = (char *) malloc(strlen(TEXT_REMOVE) + strlen(device) + strlen(label) + strlen(uuid) + strlen(fstype));
						sprintf(notification, TEXT_REMOVE, device);
						icon = ICON_REMOVE;
						break;
					case 'm':
						// m: move
						notification = (char *) malloc(strlen(TEXT_MOVE) + strlen(device) + strlen(label) + strlen(uuid) + strlen(fstype));
						sprintf(notification, TEXT_MOVE, device, label, uuid, fstype);
						icon = ICON_MOVE;
						break;
					case 'c':
						// c: change
						notification = (char *) malloc(strlen(TEXT_CHANGE) + strlen(device) + strlen(label) + strlen(uuid) + strlen(fstype));
						sprintf(notification, TEXT_CHANGE, device, label, uuid, fstype);
						icon = ICON_CHANGE;
						break;
					default:
						// we should never get here I think...
						notification = (char *) malloc(strlen(TEXT_DEFAULT) + strlen(device) + strlen(label) + strlen(uuid) + strlen(fstype));
						sprintf(notification, TEXT_CHANGE, device, label, uuid, fstype);
						icon = ICON_DEFAULT;
				}

				blkid_tag_iterate_end(iter);
				blkid_put_cache(cache);

				printf("%s: %s\n", argv[0], notification);
				netlink = notify_notification_new("Udev-Block", notification, icon);
	
			        notify_notification_set_timeout(netlink, NOTIFICATION_TIMEOUT);
				notify_notification_set_category(netlink, "Udev-Block");
				notify_notification_set_urgency (netlink, NOTIFY_URGENCY_NORMAL);
	
				while(!notify_notification_show(netlink, &error)) {
					g_printerr("%s: Error \"%s\" while trying to show notification. Trying to reconnect.\n", argv[0], error->message);
					g_error_free(error);
					error = NULL;
	
					notify_uninit();
					if(!notify_init("Udev-Block-Notification")) {
						fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
						exit(EXIT_FAILURE);
					}
				}
	
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
