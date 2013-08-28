CC := gcc
RM := rm
INSTALL := install
OUT := ebox eepromtool firm_update red_test simple_test slaveinfo
SRCS := test/linux/ebox/ebox.c test/linux/eepromtool/eepromtool.c test/linux/firm_update/firm_update.c test/linux/red_test/red_test.c test/linux/simple_test/simple_test.c test/linux/slaveinfo/slaveinfo.c
OBJS := $(patsubst %.c,%.o,$(SRCS))
CFLAGS := -ggdb3
LDFLAGS := -lpthread -lsoem
PREFIX := /usr/local
BINDIR := $(PREFIX)/bin

all: $(OUT)

%.o: %.c
	$(CC) $(CFLAGS) -MMD -c -o $@ $<
-include $(SRCS:.c=.d)

ebox: test/linux/ebox/ebox.o
	$(CC) $(LDFLAGS) -o $@ $<

eepromtool: test/linux/eepromtool/eepromtool.o
	$(CC) $(LDFLAGS) -o $@ $<

firm_update: test/linux/firm_update/firm_update.o
	$(CC) $(LDFLAGS) -o $@ $<

red_test: test/linux/red_test/red_test.o
	$(CC) $(LDFLAGS) -o $@ $<

simple_test: test/linux/simple_test/simple_test.o
	$(CC) $(LDFLAGS) -o $@ $<

slaveinfo: test/linux/slaveinfo/slaveinfo.o
	$(CC) $(LDFLAGS) -o $@ $<

clean:
	$(RM) -f $(OBJS) $(patsubst %.c,%.d$,$(SRCS)) $(OUT)

install:
	$(INSTALL) -dm755 '$(DESTDIR)$(BINDIR)'
	$(INSTALL) -Dm755 ebox '$(DESTDIR)$(BINDIR)/ebox'
	$(INSTALL) -Dm755 eepromtool '$(DESTDIR)$(BINDIR)/eepromtool'
	$(INSTALL) -Dm755 firm_update '$(DESTDIR)$(BINDIR)/firm_update'
	$(INSTALL) -Dm755 red_test '$(DESTDIR)$(BINDIR)/red_test'
	$(INSTALL) -Dm755 simple_test '$(DESTDIR)$(BINDIR)/simple_test'
	$(INSTALL) -Dm755 slaveinfo '$(DESTDIR)$(BINDIR)/slaveinfo'


.PHONY: all clean install
