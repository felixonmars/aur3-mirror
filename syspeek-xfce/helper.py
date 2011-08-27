#
#    Copyright (C) 2011  Georg Schmidl <georg.schmidl@vicox.net>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

def human_readable(bytes):
	for x in ['bytes','KiB','MiB','GiB','TiB', 'PiB' 'EiB', 'ZiB', 'YiB']:
		if bytes < 1024.0:
			if x == 'bytes':
				return '{} {}'.format(bytes, x)
			return '{:.1f} {}'.format(bytes, x)
		bytes = bytes / 1024.0
