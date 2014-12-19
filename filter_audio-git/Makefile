LDLIBS = -lm -lpthread

subdirs := agc ns aec other
sources := $(foreach dir,$(subdirs),$(wildcard $(dir)/*.c))
objects := $(sources:.c=.o)

programs := libfilteraudio.so
headers := filter_audio.h

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -fPIC -c -o $@ $<

libfilteraudio.so: filter_audio.o $(objects)
	$(CC) $(LDFLAGS) -shared -o $@ $^ $(LDLIBS)

all: $(programs)

clean:
	rm -f $(objects) $(programs)

install: $(programs) $(headers)
	install -dm755 $(DESTDIR)/usr/lib $(DESTDIR)/usr/include
	install -m755 $(programs) $(DESTDIR)/usr/lib
	install -m644 $(headers) $(DESTDIR)/usr/include
