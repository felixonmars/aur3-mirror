# (C) Copyright 2002,2003 Mihai RUSU (dizzy@roedu.net)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

CC=gcc
CCFLAGS=-O2 -g -Wall
INCLUDES=-I.
LDFLAGS=-g -L.
LIBS=
DESTDIR=

all:relayd librelay.so relayctl

install: all
	install -d -m 755 $(DESTDIR)/etc/relayd
	install -d -m 755 $(DESTDIR)/usr/bin
	install -d -m 755 $(DESTDIR)/usr/sbin
	install -d -m 755 $(DESTDIR)/usr/include
	install -d -m 755 $(DESTDIR)/usr/lib
	install -m 755 librelay.so $(DESTDIR)/usr/lib
	install -m 644 relay.h $(DESTDIR)/usr/include
	install -m 700 relayd $(DESTDIR)/usr/sbin
	install -m 755 relayctl $(DESTDIR)/usr/bin
	install -m 600 examples/ip.rules.sample $(DESTDIR)/etc/relayd/ip.rules
	install -m 600 examples/user.rules.sample $(DESTDIR)/etc/relayd/user.rules

relayd: relayd.o mylog.o server.o list.o packet.o count.o
	$(CC) $(LDFLAGS) $(LIBS) relayd.o mylog.o server.o list.o packet.o count.o -o relayd

relayd.o: relayd.c relayd.h mylog.h
	$(CC) $(CCFLAGS) $(INCLUDES) -c relayd.c

mylog.o: mylog.c mylog.h
	$(CC) $(CCFLAGS) $(INCLUDES) -c mylog.c

list.o: list.c list.h
	$(CC) $(CCFLAGS) $(INCLUDES) -c list.c

packet.o: packet.c packet.h relayd_protocol.h
	$(CC) $(CCFLAGS) $(INCLUDES) -c packet.c

count.o: count.c count.h list.h
	$(CC) $(CCFLAGS) $(INCLUDES) -c count.c

server.o: server.c server.h relayd_protocol.h
	$(CC) $(CCFLAGS) $(INCLUDES) -c server.c

librelay.so: librelay.o
	$(CC) $(LDFLAGS) -shared $(LIBS) librelay.o packet.o mylog.o -o librelay.so

librelay.o: librelay.c relay.h packet.h relayd_protocol.h
	$(CC) $(CCFLAGS) $(INCLUDES) -c librelay.c

test: test.c
	$(CC) $(CCFLAGS) $(INCLUDES) $(LDFLAGS) -lrelay test.c -o test

relayctl: relayctl.c
	$(CC) $(CCFLAGS) $(INCLUDES) $(LDFLAGS) -lrelay relayctl.c -o relayctl

clean:
	rm -f *~ *.o relayd librelay.so test relayctl
