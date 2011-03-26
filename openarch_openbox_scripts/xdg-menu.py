#!/usr/bin/env python2
#
# Copyright (C) 2008  Red Hat, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Author(s): Luke Macken <lmacken@redhat.com>
#            Miroslav Lichvar <mlichvar@redhat.com>


import gmenu, re, sys
from xml.sax.saxutils import escape

def walk_menu(entry):
	if entry.get_type() == gmenu.TYPE_DIRECTORY:
		print '<menu id="%s" label="%s">' \
			% (escape(entry.menu_id), escape(entry.get_name()))
		map(walk_menu, entry.get_contents())
		print '</menu>'
	elif entry.get_type() == gmenu.TYPE_ENTRY and not entry.is_excluded:
		print '	<item label="%s">' % escape(entry.get_name())
		command = re.sub(' [^ ]*%[fFuUdDnNickvm]', '', entry.get_exec())
		if entry.launch_in_terminal:
			command = 'xterm -title "%s" -e %s' % \
				(entry.get_name(), command)
		print '		<action name="Execute">' + \
			'<command>%s</command></action>' % escape(command)
		print '	</item>'

if len(sys.argv) > 1:
	menu = sys.argv[1] + '.menu'
else:
	menu = 'applications.menu'

print '<?xml version="1.0" encoding="UTF-8"?>'
print '<openbox_pipe_menu>'
map(walk_menu, gmenu.lookup_tree(menu).root.get_contents())
print '</openbox_pipe_menu>'
