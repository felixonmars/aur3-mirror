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

#include <libmnl/libmnl.h>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/rtnetlink.h>

#define NOTIFICATION_TIMEOUT	10000

#define NOTIFICATION_TEXT	"Interface <b>%s</b> is <b>%s</b>."
#define NOTIFICATION_TEXT_DEBUG	"%s: Interface %s (index %d) is %s.\n"

// we need these to be global...
unsigned int netlinksize = 1; // never use 0 and avoid overwriting the main pointer...
size_t * netlinkref;
char * program = NULL;

static int data_attr_cb(const struct nlattr * attr, void * data) {
	const struct nlattr ** tb = data;
	int type = mnl_attr_get_type(attr);

	if (mnl_attr_type_valid(attr, IFLA_MAX) < 0)
		return MNL_CB_OK;

	switch(type) {
		case IFLA_MTU:
			if (mnl_attr_validate(attr, MNL_TYPE_U32) < 0) {
				fprintf(stderr, "%s: Invalid netlink attribute.\n", program);
				return MNL_CB_ERROR;
			}
			break;
		case IFLA_IFNAME:
			if (mnl_attr_validate(attr, MNL_TYPE_STRING) < 0) {
				fprintf(stderr, "%s: Invalid netlink attribute.\n", program);
				return MNL_CB_ERROR;
			}
			break;
	}
	tb[type] = attr;
	return MNL_CB_OK;
}

static int data_cb(const struct nlmsghdr * nlh, void * data) {
	struct nlattr * tb[IFLA_MAX + 1] = {};
	struct ifinfomsg * ifm = mnl_nlmsg_get_payload(nlh);

	char * notification = NULL;
	const char * interface = NULL;
	NotifyNotification * netlink = NULL;
	unsigned int errcount = 0;

	gboolean res = FALSE;
	GError * error = NULL;

	mnl_attr_parse(nlh, sizeof(* ifm), data_attr_cb, tb);

	interface = mnl_attr_get_str(tb[IFLA_IFNAME]);
	notification = malloc(strlen(interface) + strlen(NOTIFICATION_TEXT) + 1); // 2* %s is enough for "down", but we need an additional byte for \n
	sprintf(notification, NOTIFICATION_TEXT, interface, (ifm->ifi_flags & IFF_RUNNING ? "up" : "down"));
	printf(NOTIFICATION_TEXT_DEBUG, program, interface, ifm->ifi_index, (ifm->ifi_flags & IFF_RUNNING ? "up" : "down"));

	if (netlinksize < ifm->ifi_index) {
		netlinkref = realloc(netlinkref, (ifm->ifi_index + 1) * sizeof(size_t));
		while(netlinksize < ifm->ifi_index)
			netlinkref[++netlinksize] = 0;
	}
	
	if (netlinkref[ifm->ifi_index] == 0) {
		netlink = notify_notification_new("Netlink", notification, (ifm->ifi_flags & IFF_RUNNING ? "network-transmit-receive" : "network-error"));
		netlinkref[ifm->ifi_index] = (size_t)netlink;
	} else {
		netlink = (NotifyNotification *)netlinkref[ifm->ifi_index];
		notify_notification_update(netlink, "Netlink", notification, (ifm->ifi_flags & IFF_RUNNING ? "network-transmit-receive" : "network-error"));
	}

	notify_notification_set_timeout(netlink, NOTIFICATION_TIMEOUT);
	notify_notification_set_category(netlink, "Netlink");
	notify_notification_set_urgency (netlink, NOTIFY_URGENCY_NORMAL);

	while(!notify_notification_show(netlink, &error)) {
		if (errcount > 1) {
			fprintf(stderr, "%s: Looks like we can not reconnect to notification daemon... Exiting.\n", program);
			exit(EXIT_FAILURE);
		} else {
			g_printerr("%s: Error \"%s\" while trying to show notification. Trying to reconnect.\n", program, error->message);
			errcount++;

			g_error_free(error);
			error = NULL;

			notify_uninit();

			usleep(500 * 1000);

			if(!notify_init("Udev-Net-Notification")) {
				fprintf(stderr, "%s: Can't create notify.\n", program);
				exit(EXIT_FAILURE);
			}
		}
	}
	errcount = 0;

	free(notification);

	return MNL_CB_OK;
}

int main(int argc, char ** argv) {
	struct mnl_socket * nl;
	char buf[MNL_SOCKET_BUFFER_SIZE];
	int ret;

	program = argv[0];

	printf("%s: %s v%s (compiled: %s)\n", argv[0], PROGNAME, VERSION, DATE);

	if(!notify_init("Netlink-Notification")) {
		fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	nl = mnl_socket_open(NETLINK_ROUTE);
	if (!nl) {
		fprintf(stderr, "%s: Can't create netlink socket.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	if (mnl_socket_bind(nl, RTMGRP_LINK, MNL_SOCKET_AUTOPID) < 0) {
		fprintf(stderr, "%s: Can't bind netlink socket.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
	while (ret > 0) {
		ret = mnl_cb_run(buf, ret, 0, 0, data_cb, NULL);
		if (ret <= 0)
			break;
		ret = mnl_socket_recvfrom(nl, buf, sizeof(buf));
	}
	if (ret == -1) {
		fprintf(stderr, "%s: An error occured reading from netlink socket.\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	mnl_socket_close(nl);

	return EXIT_SUCCESS;
}
