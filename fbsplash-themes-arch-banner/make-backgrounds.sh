#!/bin/bash

# make-backgrounds.sh           for fbsplash-themes-arch-banner #
#                                                               #
# Author: Kurt J. Bosch        <kjb-temp-2009 at alpenjodel.de> #
#                                                               #
# Distributed under the terms of the GNU General Public License #

if [[ $# != 1 ]]; then
	echo "Usage: ${0##*/} <width>x<height>" >&2
	exit 1
fi

_size=${1}
_width=${_size%x*}
_height=${_size#*x}

echo "Creating ${_size} background images"

set -e
set -u

mkdir -p images
cd images

png_args="-define png:color-type=6" # png:bit-depth=8"

convert $png_args -type TrueColorMatte -depth 8 -size $_size xc:black -fill black -draw 'color 0,0 reset' \
	silent-$_size.png
convert $png_args -type TrueColorMatte -depth 8 -size $_size xc:black -fill '#051e2a' -draw 'color 0,0 reset' \
	backgnd-$_size.png
composite $png_args -geometry +$(( _width - 640 ))+$(( _height - 200 )) \
	banner_2.png backgnd-$_size.png \
	verbose-$_size.png

# EOF #
