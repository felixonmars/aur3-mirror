#!/bin/bash

# make-cfg.sh                   for fbsplash-themes-arch-banner #
#                                                               #
# Author: Kurt J. Bosch        <kjb-temp-2009 at alpenjodel.de> #
#                                                               #
# Distributed under the terms of the GNU General Public License #

_logo=images/banner.png

arg_names=(
	name size
	sep_width sep_height
	progress_width
	font font_size
	icon_size icon_count
)
arg_count=${#arg_names[@]}
arg_opt_count=2

case $#
in $(( arg_count                 )) ) use_icons=1
;; $(( arg_count - arg_opt_count )) ) use_icons=""
;; * )
	echo "Usage: ${0##*/} ${arg_names[*]} [<icon-size> <icon-count>]" >&2
	exit 1
esac

for var in ${arg_names[@]}; do
    eval _$var=\"\$1\"; shift
done

set -e
set -u

msg() {
	echo "${0##*/}: $*" >&2
}

err() {
	msg "ERROR: $*"
	exit 1
}

for file in "$_logo" "$_font" ; do
	if [[ $file == *[[:space:]]* ]]; then
		err "Whitespace not allowed in filepaths."
	elif ! [[ -f $file ]]; then
		msg "cwd: $( pwd )"
		err "File not found: '$file'"
	fi
done

_file=${_name}/${_size}.cfg

echo "Creating '${_file}'"

mkdir -p "${_name}"

# screen size
x="${_size%x*}"
y="${_size#*x}"

# fixed point for placement
xf=$(( x / 2 ))
yf=$(( y / 2 ))

if ! [[ -f $_logo ]]; then
  err "File not found: '${_logo}'"
fi

# text font size
tf=${_font_size}

# estimated height of 1000 lines of text
th_1000=$(( 15600 * tf / 12 ))

# logo/banner size
if [[ $( convert "${_logo}" -identify /dev/null ) =~ [[:space:]]([0-9]+x[0-9]+)[[:space:]] ]]; then
	l_res=${BASH_REMATCH[1]}
	lw="${l_res%x*}"
	lh="${l_res#*x}"
else
	err "Unable to determine banner image size"
fi

# progress size
pw=$_progress_width
ph=$lh

# main area (logo + progress)
mw=$(( lw + 20 + pw ))

# separator
sx=$(( xf - _sep_width/2 ))
sy=$(( yf - _sep_height/2 ))

# main message text heigth
th=$(( th_1000/1000 ))

# status bar
sbh=$(( th + 20 ))
sbx=$(( xf - mw/2 ))
sby=$(( sy - _sep_height/2 - sbh ))

# main message text position
tx=$(( sbx + 15 ))
ty=$(( sby + sbh/2 - th/2 ))

# logo/banner position
lx=$(( xf - mw/2 ))
ly=$(( sby - lh  ))

# corners of progress bar
ptl="$(( xf + mw/2 - pw   )) $(( ly      ))" # progress top left corner
ptr="$(( xf + mw/2 - 1    )) $(( ly      ))" # progress top right corner

pbl="$(( xf + mw/2 - pw   )) $(( ly + lh ))" # progress bottom left corner
pbr="$(( xf + mw/2 - 1    )) $(( ly + lh ))" # progress bottom right corner

## icon bar
if [[ $use_icons ]]; then
	iy=$(( sy + 20 ))
	is=$_icon_size
	echo "  Using icons"
else
	iy=$(( sy + _sep_height/2 ))
	is=0
	echo "  Not using icons"
fi
iw=$(( _sep_width - is ))
ix=$(( xf - iw/2 ))

# message log
ox=$(( tx      ))
oy=$(( iy + is + 20 ))
#oy=$(( iy + is + 10 ))
of=${_font_size}
# estimated height of 1000 lines of text
oh_1000=$(( 15600 * of / 12 ))

echo "  Message log y is ${oy}"

# number of message log lines
ol=$(( 1000 * ( y - oy - 10 ) / oh_1000 ))

echo "  Number of msglog textbox lines is ${ol}"

INDENT='  '

separator_init() {
	if [[ $use_icons ]]; then
		echo "$INDENT"icon /lib/splash/cache/arch-banner-icons/fbsplash-dummy.init $sx $sy
	else
		local file="images/separator.png"
		if [[ -f $file ]]; then
			echo "$INDENT"icon "${file}" $sx $sy
		else
			err "File not found: '${file}'"
		fi
	fi
}

# args: <event> <daemon>
separator_red() {
	local file="images/separator-red.png"
	if [[ -f $file ]]; then
		echo "$INDENT"icon "${file}" $sx $sy ${1} ${2}
	else
		err "File not found: '${file}'"
	fi
}

# arg: start|stop
icon_bar() {
	local icon_cache=/lib/splash/cache/arch-banner-icons
	local -i icon_step=is*3/2
	local -i icon_count=(iw + icon_step - is)/icon_step
	if [[ $_icon_count != $icon_count ]]; then
		err "icon-count is wrong. Should be ${icon_count} !"
	fi
	local format=$INDENT
	local f
	for f in icon $icon_cache/stat_99.init 9999 9999 svc_inactive_start _icon_svc_99 'blendout(9999)'
	do
	   format+="%-${#f}s "
	done
	format+='\n'
	local event events
	local -i icon_x stat_icon_x
	local -i i=0
	while [[ i -lt _icon_count ]]; do
		icon_x=ix+i*icon_step
		stat_icon_x=icon_x+is/2
		i+=1
		if [[ ${1} = "stop" ]]; then
			printf "$format" icon ${icon_cache}/svc_${i}.init  $icon_x      $iy
			printf "$format" icon ${icon_cache}/stat_${i}.init $stat_icon_x $iy
			printf "$format" icon images/cover-a50.png         $icon_x      $iy svc_stop           _icon_svc_${i} #'blendin(125)'
			printf "$format" icon images/cover.png             $icon_x      $iy svc_stopped        _icon_svc_${i} #'blendin(125)'
		#   printf "$format" icon images/cover-small.png       $stat_icon_x $iy svc_stopped        _icon_svc_${i}
			printf "$format" icon ${icon_cache}/stop           $stat_icon_x $iy svc_stop           _icon_svc_${i}
			printf "$format" icon ${icon_cache}/fail           $stat_icon_x $iy svc_stop_failed    _icon_svc_${i}
		else
		#   printf "$format" icon ${icon_cache}/svc_${i}       $icon_x      $iy svc_inactive_start _icon_svc_${i}
			printf "$format" icon ${icon_cache}/svc_${i}       $icon_x      $iy svc_start          _icon_svc_${i}
			printf "$format" icon ${icon_cache}/svc_${i}       $icon_x      $iy svc_started        _icon_svc_${i}
			printf "$format" icon ${icon_cache}/svc_${i}       $icon_x      $iy svc_start_failed   _icon_svc_${i}
		#   printf "$format" icon images/cover-a50.png         $icon_x      $iy svc_inactive_start _icon_svc_${i}
			printf "$format" icon images/cover-a50.png         $icon_x      $iy svc_start          _icon_svc_${i} #'blendout(125)'
		#   printf "$format" icon ${icon_cache}/start          $stat_icon_x $iy svc_start          _icon_svc_${i}
			printf "$format" icon ${icon_cache}/fail           $stat_icon_x $iy svc_start_failed   _icon_svc_${i}
		fi
		echo
	done
}

{
	cat <<EOT

pic=images/verbose-$_size.png
bgcolor=0
tx=0
ty=0
tw=$x
th=$y

silentpic=images/silent-$_size.png

icon $_logo $lx $ly

text_font=$_font
text_size=$tf
text_x=$tx
text_y=$ty
text_color=#e0e0e0

icon images/separator.png $sx $sy

# This type is used by fbcondecor_helper in initcpio
# and by fbcondecor_ctl (patched version)
<type other>
</type>

<type bootup>
EOT
	separator_init
	echo
	cat <<EOT
#  box silent       $ptl $pbr #0a3f5a
  anim loop  images/progress-bkgd.mng $ptl                   blendin(125)
  box silent inter $pbl $pbr #5dbded #106691 #5dbded #106691 blendin(125)
  box silent       $ptl $pbr #5dbded #106691 #5dbded #106691 blendin(125)

EOT
	separator_red svc_start_failed fbsplash-dummy
	echo
	if [[ $use_icons ]]; then
		icon_bar start
	fi
	cat <<EOT
</type>

<type suspend>
  box silent       $ptl $pbr #0a3f5a
  box silent inter $ptl $pbr #5dbded #106691 #5dbded #106691
  box silent       $pbl $pbr #5dbded #106691 #5dbded #106691
</type>

<type reboot shutdown>
EOT
	separator_init
	echo
	cat <<EOT
  box silent       $ptl $pbr #0a3f5a
  box silent inter $ptl $pbr #5dbded #106691 #5dbded #106691
  box silent       $pbl $pbr #5dbded #106691 #5dbded #106691

EOT
	separator_red svc_stop_failed fbsplash-dummy
	echo
	if [[ $use_icons ]]; then
		icon_bar stop
	fi
	cat <<EOT
</type>

# 'tuxoniceui_fbsplash' (version 1.0) doesn't know anything about types.
# It seems to show allways simply the last item defined on top.
# With this one at the end we allways get an upward growing progress
# whether suspend or resume it done.
<type resume>
  box silent       $ptl $pbr #0a3f5a
  box silent inter $pbl $pbr #5dbded #106691 #5dbded #106691
  box silent       $ptl $pbr #5dbded #106691 #5dbded #106691
</type>

EOT
	if [[ $ol -lt 3 ]]; then
	  msg "WARNING: Not including message log."
	else
	cat <<EOT
log_lines=$ol
log_cols=80
<textbox>
  text silent $_font $of $ox $oy #e0e0e0 msglog
</textbox>

EOT
	fi
} >"${_file}"

# EOF #
