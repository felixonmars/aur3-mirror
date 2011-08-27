#!/bin/bash

# make-icons.sh                 for fbsplash-themes-arch-banner #
#                                                               #
# Author: Kurt J. Bosch        <kjb-temp-2009 at alpenjodel.de> #
#                                                               #
# Distributed under the terms of the GNU General Public License #

arg_names=(
	banner_silent banner_verbose
	sep_width sep_height
	progress_width
	icon_size icon_size_small
)

if [[ $# != ${#arg_names[@]} ]]; then
	echo "usage: ${0##*/} ${arg_names[*]}" >&2
	exit 1
fi

for var in ${arg_names[@]}; do
	eval _$var=\"\$1\"; shift
done

echo "Creating foreground images and animations"

set -e
set -u

msg() {
	echo "${0##*/}:" "$@" >&2
}

err() {
	msg "ERROR: $*"
	exit 1
}

mkdir -p images
cd images

png_args="-define png:color-type=6" # png:bit-depth=8"

# make banner images
convert $png_args -depth 8 -background none ${_banner_silent} -trim +repage banner.png
convert $png_args -background none ${_banner_verbose} banner_2.png

# logo/banner size
if [[ $( convert banner.png -identify /dev/null ) =~ [[:space:]]([0-9]+x[0-9]+)[[:space:]] ]]; then
	l_res=${BASH_REMATCH[1]}
	lw="${l_res%x*}"
	lh="${l_res#*x}"
else
	err "Unable to determine banner image size"
fi

_progress_height=$lh

# make blue separator image
convert $png_args -type TrueColorMatte -depth 8 \
	-size ${_sep_width}x${_sep_height} xc:black \
	-fill '#2979a2' -draw \
		"rectangle 1,0 $(( _sep_width - 2 )),${_sep_height}" \
	-fill '#5dbded' -draw \
		"line 0,$(( _sep_height/2 )) ${_sep_width},$(( _sep_height/2 ))" \
	separator.png

# make red separator image
convert $png_args -type TrueColorMatte -depth 8 \
	-size ${_sep_width}x${_sep_height} xc:black \
	-fill '#a22929' -draw \
		"rectangle 1,0 $(( _sep_width - 2 )),3" \
	-fill '#ed5d5d' -draw \
		"line 0,$(( _sep_height/2 )) ${_sep_width},$(( _sep_height/2 ))" \
	separator-red.png

# make dummy daemon icon
convert $png_args -type TrueColorMatte -depth 8 -size 1x1 xc:transparent dummy.png

# make black (background) cover for icons
convert $png_args -type TrueColorMatte -depth 8 -size ${_icon_size}x${_icon_size} \
	xc:black -fill black -draw 'color 0,0 reset' \
	cover.png

# make semi transparent cover for icons
convert $png_args -type TrueColorMatte -depth 8 -size ${_icon_size}x${_icon_size} \
	xc:transparent -fill 'RGBA(0,0,0,0.5)' -draw 'color 0,0 reset' \
	cover-a50.png

# make animated progress bar background - progress-bkgd.mng
rm -f spinner-*.png
stripe_height=2
increment=1
digits=$(( ${#_progress_height} + 1 ))
for (( i=_progress_height; i>0; i-=increment )) do
	ii=$i
	while [ ${#ii} -lt $digits ]; do
		ii=0$ii
	done
	convert $png_args -type TrueColorMatte -depth 8 \
		-size ${_progress_width}x${_progress_height} xc:black \
		-fill '#0a3f5a' -draw "rectangle 0,0 ${_progress_width},${_progress_height}" \
		-fill '#000000' -draw "polygon $(( _progress_width/3   )),$((_progress_height-i                   )) ${_progress_width},$((_progress_height-i-stripe_height/2                   )) ${_progress_width},$((_progress_height-i+stripe_height/2                   ))" \
		-fill '#000000' -draw "polygon $(( _progress_width*2/3 )),$((_progress_height-i-_progress_height/2))                  0,$((_progress_height-i-stripe_height/2-_progress_height/2))                  0,$((_progress_height-i+stripe_height/2-_progress_height/2))" \
		-fill '#000000' -draw "polygon $(( _progress_width*2/3 )),$((_progress_height-i+_progress_height/2))                  0,$((_progress_height-i-stripe_height/2+_progress_height/2))                  0,$((_progress_height-i+stripe_height/2+_progress_height/2))" \
	spinner-$ii.png
done
convert -delay 1x30 spinner-*.png progress-bkgd.mng

# EOF #
