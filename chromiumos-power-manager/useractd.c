#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include <unistd.h>
#include <time.h>
#include <dirent.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

#include <linux/input.h>

#include <dbus/dbus-glib.h>

#define MICROSECONDS_PER_SECOND      1000000
#define NANOSECONDS_PER_MICROSECOND  1000

#define NOTIFY_INTERVAL              (5 * MICROSECONDS_PER_SECOND)

#define POWERMANAGER_SERVICE_NAME    "org.chromium.PowerManager"
#define POWERMANAGER_SERVICE_PATH    "/org/chromium/PowerManager"
#define POWERMANAGER_INTERFACE       "org.chromium.PowerManager"

#define HANDLE_USER_ACTIVITY_METHOD  "HandleUserActivity"

#define INPUT_DEVICE_DIR             "/dev/input"

#define EVENT_DEVICE_NAME_BASE       "event"

#define BITS_PER_LONG (sizeof(long) * 8)
#define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
#define OFF(x)  ((x)%BITS_PER_LONG)
#define LONG(x) ((x)/BITS_PER_LONG)
#define test_bit(bit, array) ((array[LONG(bit)] >> OFF(bit)) & 1)

#define LID_OPEN    0
#define LID_CLOSED  1

int64_t
now(void)
{
	struct timespec ts;

	clock_gettime(CLOCK_MONOTONIC, &ts);

	return (int64_t)ts.tv_sec * MICROSECONDS_PER_SECOND +
	       (int64_t)ts.tv_nsec / NANOSECONDS_PER_MICROSECOND;
}

int
is_event_device(const struct dirent *dir)
{
	return strncmp(EVENT_DEVICE_NAME_BASE, dir->d_name,
                       sizeof(EVENT_DEVICE_NAME_BASE) - 1) == 0;
}

int
support_activity_events(int fd)
{
	unsigned long events[EV_MAX];
	unsigned long switch_events[NBITS(SW_LID + 1)];

	int retval = 0;


	memset(events, 0, sizeof(events));

	if (ioctl(fd, EVIOCGBIT(0, EV_MAX), events) < 0) {
		perror("ioctl");
		return 0;
	}

	if (test_bit(EV_KEY, events)) {
		fprintf(stderr, "EV_KEY ");
		retval |= 1;
	}
	if (test_bit(EV_REL, events)) {
		fprintf(stderr, "EV_REL ");
		retval |= 1;
	}
	if (test_bit(EV_ABS, events)) {
		fprintf(stderr, "EV_ABS ");
		retval |= 1;
	}
	if (test_bit(EV_SW, events)) {
		memset(switch_events, 0, sizeof(switch_events));
		ioctl(fd, EVIOCGBIT(EV_SW, SW_LID + 1), switch_events);
		if (test_bit(SW_LID, switch_events)) {
			fprintf(stderr, "SW_LID ");
			retval |= 1;
		}
	}

	if (retval)
		fprintf(stderr, "\n");

	return retval;
}

int
get_input_devices(int **fds)
{
	struct dirent **namelist;
	char fname[64];
	int fd;
	int ndev;
	int i;

	int nfds = 0;

	ndev = scandir(INPUT_DEVICE_DIR, &namelist,
                       is_event_device, alphasort);
	if (ndev <= 0)
		return -1;

	*fds = malloc(ndev * sizeof(int));

	fprintf(stderr, "ndev: %i\n", ndev);
	for (i = 0; i < ndev; i++) {
		snprintf(fname, sizeof(fname),
                         "%s/%s", INPUT_DEVICE_DIR, namelist[i]->d_name);
		fd = open(fname, O_RDONLY);
		if (fd < 0)
			continue;

		fprintf(stderr, "Checking %s for activity events...\n", fname);
		if (support_activity_events(fd)) {
			(*fds)[nfds++] = fd;
		}
		else {
			close(fd);
		}
	}

	return nfds;
}

int
get_event(struct input_event *e, int nfds, int *fds)
{
	fd_set rfds;
	int retval;
	int i;

	FD_ZERO(&rfds);
	for (i = 0; i < nfds; i++)
		FD_SET(fds[i], &rfds);

	retval = select(FD_SETSIZE, &rfds, NULL, NULL, NULL);

	if ((retval < 0) && (errno != EINTR)) {
		perror("select");
		return -1;
	}

	for (i = 0; i < nfds; i++)
		if (FD_ISSET(fds[i], &rfds)) {
			return read(fds[i], e, sizeof(struct input_event));
		}

	return 0;
}

int
main(int argc, char **argv)
{
	int nfds;
	int *fds;

	struct input_event e;

	DBusGConnection *connection;
	GError *gerror;
	DBusGProxy *proxy;

	int retval;
	int i;

	int64_t ticks, last_ticks;

	int lid_state = LID_OPEN;


	/* initialize glib */
	g_type_init();

	/* connect to dbus */
	gerror = NULL;
	connection = dbus_g_bus_get(DBUS_BUS_SYSTEM, &gerror);
	if (connection == NULL) {
		g_printerr("Failed to open connection to bus: %s\n",
		           gerror->message);
		g_error_free(gerror);
		exit(1);
	}

	/* create a proxy for the bus driver */
	proxy = dbus_g_proxy_new_for_name(connection,
	                                  POWERMANAGER_SERVICE_NAME,
	                                  POWERMANAGER_SERVICE_PATH,
	                                  POWERMANAGER_INTERFACE);

	/* get input devices with key, movement, or switch events */
	nfds = get_input_devices(&fds);
	if (nfds < 1) {
		fprintf(stderr, "No user input devices\n");
		return 1;
	}

	/* wait for events and send notifications */
	last_ticks = 0;
	while (1) {
		retval = get_event(&e, nfds, fds);
		if (retval < 0) {
			perror("read\n");
			return 1;
		}
		else if (retval == 0) {
			continue;
		}

		if (e.type == EV_SW && e.code == SW_LID)
			lid_state = e.value;

		if (lid_state == LID_CLOSED)
			continue;

		ticks = now();
		if ((ticks - last_ticks) >= NOTIFY_INTERVAL) {
			gerror = NULL;
			retval = dbus_g_proxy_call(proxy,
			                           HANDLE_USER_ACTIVITY_METHOD,
			                           &gerror,
			                           G_TYPE_INT64, ticks,
			                           G_TYPE_INVALID,
			                           G_TYPE_INVALID);
			if (!retval) {
				g_printerr("Error: %s\n", gerror->message);
				g_error_free(gerror);
				exit(1);
			}
			last_ticks = ticks;
		}
	}

	/* cleanup */
	for (i = 0; i < nfds; i++)
		close(fds[i]);

	g_object_unref(proxy);

	return 0;
}
