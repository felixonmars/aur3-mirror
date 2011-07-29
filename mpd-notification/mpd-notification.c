/*
 * (C) 2011 by Christian Hesse <mail@eworm.de>
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

int main(int argc, char ** argv) {
	struct mpd_connection * conn = mpd_connection_new(NULL, 0, 30000);
	char * title = NULL;
	char * artist = NULL;
	char * album = NULL;
	char * notification = NULL;
        NotifyNotification * netlink;

	GError * error = NULL;

	if (mpd_connection_get_error(conn) != MPD_ERROR_SUCCESS) {
		fprintf(stderr,"%s: %s\n", argv[0], mpd_connection_get_error_message(conn));
		mpd_connection_free(conn);
                exit(EXIT_FAILURE);
	}

        if(!notify_init("Udev-Net-Notification")) {
                fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
                exit(EXIT_FAILURE);
        }

	while(mpd_run_idle_mask(conn, MPD_IDLE_PLAYER)) {
		struct mpd_song * song;

		mpd_command_list_begin(conn, true);
		mpd_send_status(conn);
		mpd_send_current_song(conn);
		mpd_command_list_end(conn); 

		mpd_response_next(conn);

		song = mpd_recv_song(conn);

		title = g_markup_escape_text(mpd_song_get_tag(song, MPD_TAG_TITLE, 0), -1);
		artist = g_markup_escape_text(mpd_song_get_tag(song, MPD_TAG_ARTIST, 0), -1);
		album = g_markup_escape_text(mpd_song_get_tag(song, MPD_TAG_ALBUM, 0), -1);

		notification = (char *) malloc(strlen(title) + strlen(artist) + strlen(album) + 32); /* we need 32 character for the formatting */
		sprintf(notification, "<b>%s</b>\nby <i>%s</i>\nfrom <i>%s</i>", title, artist, album);

	        netlink = notify_notification_new("MPD Notification", notification, "sound");

		while(!notify_notification_show(netlink, &error)) {
			g_printerr("%s: Error \"%s\" while trying to show notification. Trying to reconnect.\n", argv[0], error->message);
			g_error_free(error);
			error = NULL;

			notify_uninit();
			if(!notify_init("mpdnotify")) {
				fprintf(stderr, "%s: Can't create notify.\n", argv[0]);
				exit(EXIT_FAILURE);
			}
		}

		free(notification);
		mpd_response_finish(conn);
		mpd_song_free(song);
	}
	mpd_connection_free(conn);

	return EXIT_SUCCESS;
}
