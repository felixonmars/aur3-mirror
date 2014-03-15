#!/bin/sh
#
# Copyright 2013 Canonical Ltd.
#
# Author: Alberto Milone <alberto.milone@canonical.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
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
ERROR_LOG=/var/log/optimus.log

# Only for NVIDIA's proprietary driver
if ! lsmod | grep nvidia > /dev/null; then
    # Sorry the driver is not is loaded
    echo "Sorry the nvidia kernel module is not is loaded" \
         > $ERROR_LOG 2>&1
    exit 0
fi

# We only support intel + nvidia
cards="$(lspci -n)"
# the different classes as per pci.ids
# Syntax:
# C class   class_name
#   subclass    subclass_name       <-- single tab
#       prog-if  prog-if_name   <-- two tabs
#C 03  Display controller
#    00  VGA compatible controller
#        00  VGA controller
#        01  8514 controller
#    01  XGA compatible controller
#    02  3D controller
#    80  Display controller
gfx_300="$(echo "$cards" | grep 300)"
gfx_301="$(echo "$cards" | grep 301)"
gfx_302="$(echo "$cards" | grep 302)"
gfx_380="$(echo "$cards" | grep 380)"

has_nvidia=false
has_intel=false

for gfx_class in "$gfx_300" "$gfx_301" "$gfx_302" "$gfx_380"; do
    if echo "$gfx_class" | egrep -q "8086"; then
      # Intel detected
      has_intel=true
    fi
    if echo "$gfx_class" | egrep -q "10de"; then
      # Nvidia detected
      has_nvidia=true
    fi
done

if ! $has_intel || ! $has_nvidia; then
    echo "Sorry we only support Intel+Nvidia" \
         > $ERROR_LOG 2>&1
    exit 0
fi

# Check the xrandr version
randr_ver="$(xrandr -v)"
client=$(echo "$randr_ver" | grep "program" | awk '{print $NF}' | cut -d. -f2)
client_point=$(echo "$randr_ver" | grep "program" | awk '{print $NF}' | cut -d. -f3)
server=$(echo "$randr_ver" | grep -i "server" | awk '{print $NF}' | cut -d. -f2)

# There may not be a point version
[ -z "$client_point" ] && client_point=0

if [ "$client" -ge 4 -a "$server" -ge 4 ]; then
    # client and server ver >= 1.4
    use_randr_names=true
elif [ "$client" -eq 3 -a "$client_point" -eq 5 \
       -a "$server" -ge 4 ]; then
    # client ver 1.3.5 and server ver >= 1.4
    use_randr_names=false
else
    # client and server ver < 1.4
    echo "Sorry we only support randr 1.4 or higher" \
         > $ERROR_LOG 2>&1
    exit 0
fi

# Get the xrandr providers
output="$(xrandr --listproviders)"

if [ "$use_randr_names" = true ]; then
    # Use the providers' names
    src=$(echo "$output" | grep " Source" | \
          head -n1 | awk '{print $NF}' | cut -d: -f2)
    sink=$(echo -e "$output" | grep " Sink" | \
           head -n1 | awk '{print $NF}' | cut -d: -f2)
else
    # Use the providers' ids
    src=$(echo "$output" | grep " Source" | \
          head -n1 | cut -d: -f3 | cut -d" " -f2)
    sink=$(echo -e "$output" | grep " Sink" | \
           head -n1 | cut -d: -f3 | cut -d" " -f2)
fi

# Pass provider or sink and source
xrandr --setprovideroutputsource "$sink" "$src"

# Make sure xrandr sees all the outputs
xrandr --auto

# Do not move up. Only now xrandr shows the outputs
lvds=$(xrandr | grep -i "lvds" | head -n1 |cut -d " " -f 1)
xrandr --output "$lvds" --off
xrandr --output "$lvds" --auto
