/*
 * (C) 2011-2012 by Christian Hesse <mail@eworm.de>
 *
 * This software may be used and distributed according to the terms
 * of the GNU General Public License, incorporated herein by reference.
 */

#include <mpd/client.h>

#include <libnotify/notify.h>

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#define NOTIFICATION_TIMEOUT	10000

#define TEXT_PLAY	"Playing\n<b>%s</b>\nby <i>%s</i>\nfrom <i>%s</i>"
#define TEXT_STOP	"Stopped playback"
#define TEXT_UNKNOWN	"(unknown)"

int main(int argc, char ** argv) {
	struct mpd_connection * conn = mpd_connection_new(NULL, 0, 30000);
	char * title = NULL;
	char * artist = NULL;
	char * album = NULL;
        NotifyNotification * netlink = NULL;
	struct mpd_song * song = NULL;
	char * notification = NULL;
	int errcount = 0;

	GError * error = NULL;

	printf("%s: %s v%s (compiled: %s)\n", argv[0], PROGNAME, VERSION, DATE);

	if (mpd_connection_get_error(conn) != MPD_ERROR_SUCCESS) {
		fprintf(stderr,"%s: %s\n", argv[0], mpd_connection_get_error_message(conn));
		mpd_connection_free(conn);
                exit(EXIT_FAILURE);
	}

        if(!notify_init("Udev-Net-Notification")) {
                fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
                exit(EXIT_FAILURE);
        }

	netlink = notify_notification_new("MPD Notification", NULL, "sound");

	while(mpd_run_idle_mask(conn, MPD_IDLE_PLAYER)) {
		mpd_command_list_begin(conn, true);
		mpd_send_status(conn);
		mpd_send_current_song(conn);
		mpd_command_list_end(conn); 

		if (mpd_status_get_state(mpd_recv_status(conn)) == MPD_STATE_PLAY) {
			mpd_response_next(conn);

			song = mpd_recv_song(conn);

			if ((title = g_markup_escape_text(mpd_song_get_tag(song, MPD_TAG_TITLE, 0), -1)) == NULL)
				title = TEXT_UNKNOWN;
			if ((artist = g_markup_escape_text(mpd_song_get_tag(song, MPD_TAG_ARTIST, 0), -1)) == NULL)
				artist = TEXT_UNKNOWN;
			if ((album = g_markup_escape_text(mpd_song_get_tag(song, MPD_TAG_ALBUM, 0), -1)) == NULL)
				album = TEXT_UNKNOWN;

			notification = (char *) malloc(strlen(TEXT_PLAY) + strlen(title) + strlen(artist) + strlen(album));
			sprintf(notification, TEXT_PLAY, title, artist, album);

			mpd_song_free(song);
		} else {
			notification = (char *) malloc(strlen(TEXT_STOP));
			sprintf(notification, TEXT_STOP);
		}

		printf("%s: %s\n", argv[0], notification);

		notify_notification_update(netlink, "MPD Notification", notification, "sound");

		notify_notification_set_timeout(netlink, NOTIFICATION_TIMEOUT);
		notify_notification_set_category(netlink, "MPD-Notification");
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

				if(!notify_init("mpdnotify")) {
					fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
					exit(EXIT_FAILURE);
				}
			}
		}
		errcount = 0;

		free(notification);
		mpd_response_finish(conn);
	}
	mpd_connection_free(conn);

	return EXIT_SUCCESS;
}
