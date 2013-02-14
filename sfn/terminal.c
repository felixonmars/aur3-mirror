#include <sys/ioctl.h>

static struct winsize tty_size;

int getTerminalWidth()
{
	ioctl(0, TIOCGWINSZ, &tty_size);
	if (tty_size.ws_col == 0)
	{
		return 80;
	}
	else
	{
		return tty_size.ws_col;
	}
}
