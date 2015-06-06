
/* gcc -o tmp `pkg-config --libs --cflags glib-2.0` tmp.c
 *
 * # modprobe ec_sys
 *
 * # watch -n 0.1 hexdump -C /sys/kernel/debug/ec/ec0/io
 *
 * 00000000  a7 05 a0 e2 00 86 05 00  00 00 47 00 00 03 00 10  |..........G.....|
 * 00000000  a7 05 a0 e2 00 86 05 00  00 00 47 00 00 43 00 10  |..........G..C..|
 * 00000000  a7 05 a0 e2 00 86 05 00  00 00 47 00 00 83 00 10  |..........G.....|
 *
 * # ./tmp 0
 * # ./tmp 1
 * # ./tmp 2
 *
 */

#include <glib.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

char levels[] = {
	0x03,
	0x43,
	0x83
};

static void
usage (char **argv)
{
	g_print ("%s [level]\n", argv[0]);
	g_print ("Where level is between 1 and 3\n");
}

int main (int argc, char **argv)
{
	int fd;
	int level;

	if (argc < 2) {
		usage (argv);
		return 1;
	}
	level = atoi(argv[1]);
	if (level < 0 || level > 3) {
		usage (argv);
		return 1;
	}

	fd = open ("/sys/kernel/debug/ec/ec0/io", O_RDWR);
	if (fd < 0) {
		g_print ("open: %s\n", g_strerror (errno));
		return 1;
	}
	if (lseek (fd, 0xd, SEEK_CUR) < 0) {
		g_print ("seek: %s\n", g_strerror (errno));
		return 1;
	}
	if (write (fd, &levels[level], 1) < 0) {
		g_print ("write: %s\n", g_strerror (errno));
		return 1;
	}

	return 0;
}