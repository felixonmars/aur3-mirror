# --- auto generated GDIS makefile

USE_GUI = YES
USE_GRISU = NO
USE_PYTHON = NO
include makefile.linux
include makefile.src

CFLAGS := $(CFLAGS)  -DWITH_GUI -pthread -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng14 -I/usr/include/gtkglext-1.0 -I/usr/lib/gtkglext-1.0/include  
INCS := $(INCS) 
LIBS := $(LIBS) -pthread -Wl,--export-dynamic -lgtkglext-x11-1.0 -lgdkglext-x11-1.0 -lGLU -lGL -lXmu -lXt -lSM -lICE -lgtk-x11-2.0 -lpangox-1.0 -lX11 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lpng14 -lm -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0  

OBJ = $(SRC:.c=.o)

gdis: $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) -o gdis $(LIBS)
.c.o:
	$(CC) $(CFLAGS) -c $< $(INCS)

include makefile.other
