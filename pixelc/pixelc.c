// usage: ./pixelc startx starty endx endy r g b [variation-rgb] [steps]
#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
void
// resolve pixelcolor at position x y
get_pixel_color (Display *display, int x, int y, XColor *color)
{
  XImage *image;
  image = XGetImage (display, RootWindow (display, DefaultScreen (display)), x, y, 1, 1, AllPlanes, XYPixmap);
  color->pixel = XGetPixel (image, 0, 0);
  XFree (image);
  XQueryColor (display, DefaultColormap(display, DefaultScreen (display)), color);
}

main (int argc, char *argv[]) {
Display *display = XOpenDisplay((char *) NULL);
XColor color;
// validate legal arguments
        int i;
        (void) fprintf (stderr,"passed arguments: %d\n", argc);
        if (argc < 8) {
                (void) fprintf (stderr,"Not enough arguments passed!\n");
                exit(0);
        }
        else if (argc < 9) {
                (void) fprintf (stderr,"No var-rgb and pxstep argument passed, setting to 0 and 1\n");
                argc = 10;
                argv[8] = "";
                argv[9] = "1";
        }
        else if (argc < 10) {
                (void) fprintf (stderr,"No pxstep argument passed, setting to 1\n");
                argc = 10;
                argv[9] = "1";
        }
        else {
                (void) fprintf (stderr,"enough arguments passed!\n");
        }
        for (i = 0; i < argc; i += 1) {
                (void) fprintf (stderr,"argv[%d]: %s\n", i, argv[i]);
        }

        int
            startx = atoi(argv[1]),
            starty = atoi(argv[2]),
            endx = atoi(argv[3]),
            endy = atoi(argv[4]),
            lfr = atoi(argv[5]),
            lfg = atoi(argv[6]),
            lfb = atoi(argv[7]),
            varlfrgb = atoi(argv[8]),
            pxsteps = atoi(argv[9]),
            r,
            g,
            b,
            x = startx - pxsteps,
            y = starty,
            lfrmax = lfr + varlfrgb,
            lfgmax = lfg + varlfrgb,
            lfbmax = lfb + varlfrgb,
            lfrmin = lfr - varlfrgb,
            lfgmin = lfg - varlfrgb,
            lfbmin = lfb - varlfrgb,
            endsearch = 0,
            fail = 1,
            matches = 0;

// validate legal lf-rgbs
        if (lfrmax < 0) {
                lfrmax = 0;
        }
        else if (lfrmax > 255) {
                lfrmax = 255;
        }
        if (lfgmax < 0) {
                lfgmax = 0;
        }
        else if (lfgmax > 255) {
                lfgmax = 255;
        }
        if (lfbmin < 0) {
                lfbmin = 0;
        }
        else if (lfbmax > 255) {
                lfbmax = 255;
        }
        if (lfrmin < 0) {
                lfrmin = 0;
        }
        else if (lfrmin > 255) {
                lfrmin = 255;
        }
        if (lfgmin < 0) {
                lfgmin = 0;
        }
        else if (lfgmin > 255) {
                lfgmin = 255;
        }
        if (lfbmin < 0) {
                lfbmin = 0;
        }
        else if (lfbmin > 255) {
                lfbmin = 255;
        }
// sum up search data
        (void) fprintf (stderr,"Region: %d,%d - %d,%d\n", startx, starty, endx, endy);
        (void) fprintf (stderr,"varRGB: %d - Steps: %d\n", varlfrgb, pxsteps);
        (void) fprintf (stderr,"RGB: %d %d %d - maxRGB: %d %d %d - minRGB: %d %d %d\n", lfr, lfg, lfb, lfrmax, lfgmax, lfbmax, lfrmin, lfgmin, lfbmin);
// search for rgb in region startxy - endxy
while (endsearch == 0) {
        while (x < endx) {
                x = x + pxsteps;
                matches = 0;
                get_pixel_color (display, x, y, &color);
                r = (color.red >> 8);
                g = (color.green >> 8);
                b = (color.blue >> 8);
                if (r <= lfrmax && r >= lfrmin) {
                        matches = matches + 1;
                }
                if (g <= lfgmax && g >= lfgmin) {
                        matches = matches + 1;
                }
                if (b <= lfbmax && b >= lfbmin) {
                        matches = matches + 1;
                }
                (void) fprintf (stderr,"%d %d %d @ %d,%d\n", r,g,b,x,y);
                if (matches == 3) {
                        break;
                }
        }
        if (matches == 3) {
                endsearch = 1;
                fail = 0;
                (void) fprintf (stderr,"found it\n");
        }
        else if (y >= endy && matches != 3) {
                matches = 3;
                fail = 1;
                endsearch = 1;
                (void) fprintf (stderr,"FAIL!!\n");
        }
        else {
                y = y + pxsteps;
                x = startx - pxsteps;
                matches = 0;
                (void) fprintf (stderr,"restart new line\n");
        }
}
// report result
switch(fail) {
        case 0: (void) fprintf (stdout,"%d %d\n",x,y); break;
        case 1: (void) fprintf (stdout,"error\n"); break;
        default: (void) fprintf (stdout,"default (error?)\n"); break;
}
        (void) fflush (stdout);
        return 0;
}
