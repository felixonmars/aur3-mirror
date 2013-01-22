CC ?= gcc

PLUGINDIR ?= $(shell pkg-config --variable=plugindir purple)

CFLAGS += -Wall -fPIC
LDFLAGS += -shared
CPPFLAGS += $(shell pkg-config --cflags glib-2.0 json-glib-1.0 purple)
LIBS += $(shell pkg-config --libs glib-2.0 json-glib-1.0 purple)

TARGET = libsteam.so

OBJS = libsteam.o steam_connection.o

%.o: %.c %.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $*.c

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ $(OBJS) $(LIBS)

install: $(TARGET)
	@install -Dm755 $(TARGET) "$(DESTDIR)$(PLUGINDIR)/$(TARGET)"

uninstall:
	@rm -f "$(DESTDIR)$(PLUGINDIR)/$(TARGET)"

clean:
	@rm -f $(OBJS) $(TARGET)

.PHONY: uninstall clean
