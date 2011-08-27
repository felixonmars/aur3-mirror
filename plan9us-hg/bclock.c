/* Author: Rob DeHart IRC Asaph                 */
/* Home: http://rob.cqtopia.com/plan9/bclock.c  */

#include <u.h>
#include <libc.h>
#include <draw.h>
#include <event.h>

#define MARGIN 4

Image *bground, *gray;

void draw_block(int x, int y, int on)
{
	Image *color;
	Rectangle rect, bounds;
	rect = screen->r;
	int boxX, boxY;
	boxX = (rect.max.x - rect.min.x - MARGIN * 7) / 6;
	boxY = (rect.max.y - rect.min.y - MARGIN * 5) / 4;
	bounds = Rect(MARGIN + rect.min.x + x * (boxX + MARGIN),
		      MARGIN + rect.min.y + y * (boxY + MARGIN),
		      MARGIN + rect.min.x + x * (boxX + MARGIN) + boxX,
		      MARGIN + rect.min.y + y * (boxY + MARGIN) + boxY);
	if (on)
		color = display->black;
	else
		color = gray;
	draw(screen, bounds, color, nil, rect.min);
}

void light_cols(int num, int grp)
{
	int tens, ones, i;
	tens = num / 10;
	ones = num % 10;
	for (i = 3; i >= 0; --i)
	{
		if ((grp == 0 && i <= 1) || (grp != 0 && i <= 2))
			draw_block(grp * 2, 3 - i, tens >> i & 1);
		draw_block(grp * 2 + 1, 3 - i, ones >> i & 1);
	}
}


void
redraw(Image *screen)
{
	static int tm, ntm;
	static Rectangle r;
	static Tm tms;
	static Tm ntms;

	ntm = time(0);
	if(ntm == tm && eqrect(screen->r, r))
		return;

	ntms = *localtime(ntm);
	tm = ntm;
	tms = ntms;
	r = screen->r;

	draw(screen, screen->r, bground, nil, ZP);
	light_cols(ntms.hour, 0);
	light_cols(ntms.min, 1);
	light_cols(ntms.sec, 2);

	flushimage(display, 1);
}

void
eresized(int new)
{
	if(new && getwindow(display, Refnone) < 0)
		fprint(2,"can't reattach to window");
	redraw(screen);
}

#ifdef PLAN9PORT
void
usage(void)
{
	fprint(2, "usage: bclock [-W winsize]\n");
	exits("usage");
}
#endif

void
main(int argc, char *argv[])
{
	Event e;
	Mouse m;
	Menu menu;
	char *mstr[] = {"exit", 0};
	int key, timer;

#ifdef PLAN9PORT
	ARGBEGIN{
	case 'W':
		winsize = EARGF(usage());
		break;
	default:
		usage();
	}ARGEND
#endif

	initdraw(0,0,"bclock");
	bground = allocimagemix(display, DPalebluegreen, DWhite);
	gray = allocimage(display, Rect(0, 0, 1, 1), RGB24, 1, 0xDDDDDDFF);

	redraw(screen);

	einit(Emouse);
	timer = etimer(0, 1000);

	menu.item = mstr;
	menu.lasthit = 0;
	for(;;) {
		key = event(&e);
		if(key == Emouse) {
			m = e.mouse;
			if(m.buttons & 4) {
				if(emenuhit(3, &m, &menu) == 0)
					exits(0);
			}
		} else if(key == timer) {
			redraw(screen);
		}
	}
}
