#!/usr/bin/env python2
# -*- coding: utf-8 -*-

# Copyright © 2005, Simon E. Ward
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of version 2 of the GNU General Public
# License as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA 

from os.path import sep, splitext
from sre import compile
import sys

state_map = {
    'play': u'Playing',
    'pause': u'Paused',
    'stop': u'Stopped'
    }
"""Mapping from the states we get from mpd to nicer display names."""

fields = ['artist', 'album', 'track', 'title']
"""The fields to display."""

strip_paths = []
"""List of path prefixes to remove from the filename for display."""


strip_expr = compile(u'(%s)/' % ur'|'.join(strip_paths))

def get_status(connection):
    """Get playing state and song information.
    
    @return: Play state and song information.
    @rtype: C{dict}
    @param connection: mpd connection to use.
    @type connection: C{mpdclient2.mpd_connection}
    """
    songinfo = {}
    songinfo['state'] = state_map[connection.status()['state']]
    song = connection.currentsong()
    songinfo['song'] = \
        u' - '.join([unicode(song[f])
        for f in fields
            if song.has_key(f)]) \
            or unicode(strip_expr.sub(u'',
                    splitext(unicode(song['file']))[0]).replace(sep, u' - '))
    return songinfo

if __name__ == '__main__':
    import locale, codecs
    from mpdclient2 import connect
    enc = locale.getpreferredencoding()
    sys.stdout = codecs.getwriter(enc)(sys.__stdout__)
    format = u'♫ %(state)s: %(song)s'
    print format % get_status(connect())
