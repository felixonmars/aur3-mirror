#!/usr/bin/python

# Copyright (C) 2007, Darwin Bautista
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
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


import subprocess
import os

# Filename of icon map
icon_map = "ICONSLIST"

# Generate list of icons
find = subprocess.Popen(["find", "-type", "f", "-iname", "*.svg", "-o", "-iname", "*.svgz"], stdout=subprocess.PIPE)

# Initial read
icon = find.stdout.readline().rstrip("\n")

while icon:
  # Extract path
  basename = os.path.basename(icon.rstrip("svg").rstrip("svgz").rstrip("."))
  path = os.path.dirname(icon)

  # Fetch data from icon map
  grep = subprocess.Popen(["grep", "-w", basename, icon_map], stdout=subprocess.PIPE)
  map = grep.stdout.readline().rstrip("\n")

  # If there are multiple matches, browse through every one of them; TODO: try to make grep handle this instead
  while map:
    try:
      (category, new_name, old_name) = map.split("\t")
    except ValueError:
      pass
    if new_name == basename:
      break
    map = grep.stdout.readline().rstrip("\n")

  # If map is valid, try renaming icon
  if map and new_name != old_name:
      os.system("mv " + icon + " " + path + "/" + old_name + "." + icon.rsplit('.', 1)[1])

  # Get next icon
  icon = find.stdout.readline().rstrip("\n")
