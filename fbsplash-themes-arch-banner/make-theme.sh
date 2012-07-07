#!/bin/bash

# make-theme.sh                 for fbsplash-themes-arch-banner #
#                                                               #
  author_name="Kurt J. Bosch"
  author_email="kjb-temp-2009 at alpenjodel.de"
#                                                               #
# Distributed under the terms of the GNU General Public License #

work_dir=cache

arg_names=(
	theme_name
	flavour style color verbose_flavour
	icon_size
	font_file font_size
	share_dir
	version url theme_license
)

if (( $# < ${#arg_names[@]} + 1 )); then
	echo "Usage: ${0##*/} ${arg_names[*]} screen-size..." >&2
	exit 1
fi

for var in ${arg_names[@]}; do
	read -r $var < <( echo "$1" )
	shift
done

set -e
set -u

logo_file=archlinux-${flavour}-${style}.png

description="Theme with ArchLinux logo '${flavour}-${style}' and customizable services-icons"

# separator images dimensions
separator_w=640
separator_h=3
# width of the vertical progress bar
progress_w=20

msg() {
	echo "${0##*/}: $*" >&2
}

err() {
	msg "ERROR: $*"
	exit 1
}

check_file() {
	[[ -f $1 ]] && return 0
	msg "cwd: $( pwd )"
	err "File not found: '$1'"
}

png_args="-define png:color-type=6" # png:bit-depth=8"

_msg() {
	# aligned to appear below makepkg msg2()
	echo "     $*" >&2
}

make_logo() {
	local file_name=$1
	[[ -f images/$file_name ]] && return 0

	_msg images/"$file_name"
	mkdir -p images
	convert $png_args -depth 8 -background none \
		/usr/share/archlinux/logos/"${file_name/%.*/.svg}" -trim +repage \
		images/"${file_name}"
}

# make separator line images
make_separator() {
	local file_name=$1 color_1=$2 color_2=$3
	[[ -f images/$file_name ]] && return 0

	_msg images/"$file_name"
	mkdir -p images
	convert $png_args -type TrueColorMatte -depth 8 \
		-size "\
$(( separator_w     ))x$(( separator_h   ))" xc:black \
		-fill "${color_1}" \-draw "rectangle \
$(( 1               )),$(( 0             )) \
$(( separator_w - 2 )),$(( separator_h   ))" \
		-fill "${color_2}" -draw "line \
$(( 0               )),$(( separator_h/2 )) \
$(( separator_w     )),$(( separator_h/2 ))" \
		images/"${file_name}"
}

make_helpers() {
	mkdir -p images

	# make services placeholder icon
	local file_name=dummy.png
	if ! [[ -f images/$file_name ]]; then
		_msg images/"$file_name"
		convert $png_args -type TrueColorMatte -depth 8 -size 1x1 xc:transparent \
			images/$file_name
	fi

	# make black (background) services icons cover
	local file_name=cover.png
	if ! [[ -f images/$file_name ]]; then
		_msg images/"$file_name"
		convert $png_args -type TrueColorMatte -depth 8 -size ${icon_size}x${icon_size} \
			xc:black -fill black -draw 'color 0,0 reset' \
			images/$file_name
	fi

	# make semi transparent services icons cover
	local file_name=cover-a50.png
	if ! [[ -f images/$file_name ]]; then
		_msg images/"$file_name"
		convert $png_args -type TrueColorMatte -depth 8 -size ${icon_size}x${icon_size} \
			xc:transparent -fill 'RGBA(0,0,0,0.5)' -draw 'color 0,0 reset' \
			images/$file_name
	fi
}

# make animated progress bar backgrounds
make_anims() {
	local postfix=$1 color=$2
	local file_name_start=progress-bkgd-start-$postfix.mng
	local file_name_stop=progress-bkgd-stop-$postfix.mng
	if ! [[ -f images/$file_name_start && -f images/$file_name_stop ]]; then
		_msg images/"$file_name_start" images/"$file_name_stop"
		mkdir -p images
		local tmpdir
		tmpdir=$( mktemp -d spl_banner_anims_XXXXXX ) || return 1
		local digits=$(( ${#progress_h} + 1 ))
		local stripe_h=2
		local i a=0 b=$(( progress_h - 1 ))
		for (( i=a; i<=b; i++ )) do
			local ii_start=$( printf "%0${digits}i" $(( b - i )) )
			local ii_stop=$(  printf "%0${digits}i" $((     i )) )
			convert $png_args -type TrueColorMatte -depth 8 \
				-size \
		$(( progress_w     ))x$(( progress_h )) xc:black \
				-fill "$color" -draw "rectangle \
		$(( 0              )),$(( 0          )) \
		$(( progress_w     )),$(( progress_h ))" \
				-fill '#000000' -draw "polygon \
		$(( progress_w/3   )),$(( i              )) \
		$(( progress_w     )),$(( i - stripe_h/2 )) \
		$(( progress_w     )),$(( i + stripe_h/2 ))" \
				-fill '#000000' -draw "polygon \
		$(( progress_w*2/3 )),$(( i              - progress_h/2 )) \
		$(( 0              )),$(( i - stripe_h/2 - progress_h/2 )) \
		$(( 0              )),$(( i + stripe_h/2 - progress_h/2 ))" \
				-fill '#000000' -draw "polygon \
		$(( progress_w*2/3 )),$(( i              + progress_h/2 )) \
		$(( 0              )),$(( i - stripe_h/2 + progress_h/2 )) \
		$(( 0              )),$(( i + stripe_h/2 + progress_h/2 ))" \
			$tmpdir/spinner-stop-${ii_stop}.png
			cp $tmpdir/spinner-stop-${ii_stop}.png \
				$tmpdir/spinner-start-${ii_start}.png
		done
		convert -delay 1x30 $tmpdir/spinner-start-*.png images/$file_name_start
		convert -delay 1x30 $tmpdir/spinner-stop-*.png images/$file_name_stop
		rm -rf $tmpdir
	fi
	echo $file_name_start $file_name_stop
}

# screen backgrounds

make_silent() {
	local file_name=silent-$screen_size.png
	if ! [[ -f images/$file_name ]]; then
		_msg images/"$file_name"
		mkdir -p images
		convert $png_args -type TrueColorMatte -depth 8 -size $screen_size xc:black -fill black -draw 'color 0,0 reset' \
			images/silent-$screen_size.png
	fi
	echo "$file_name"
}

make_verbose() {
	local flavour=$1 color_name=$2 color=$3
	local file_name=verbose-${flavour}-${color_name}-${screen_size}.png
	if ! [[ -f images/$file_name ]]; then
		_msg images/"$file_name"
		mkdir -p .tmp/images
		( cd .tmp && make_logo archlinux-${flavour}-black.png )

		[[ -f .tmp/backgrnd-${color_name}-${screen_size}.png ]] ||
			convert $png_args -type TrueColorMatte -depth 8 -size $screen_size xc:black -fill "${color}" -draw 'color 0,0 reset' \
				.tmp/images/backgrnd-${color_name}-${screen_size}.png

		local x=$(( screen_w - 20 - logo_w )) y=$(( screen_h - 20 - logo_h ))
		# If wide screen, avoid logo hidden behind [DONE]
		(( x >= 6*8*2 )) && x=$(( x - 6*8 ))
		composite $png_args -geometry +${x}+${y} \
			.tmp/images/archlinux-${flavour}-black.png \
			.tmp/images/backgrnd-${color_name}-${screen_size}.png \
				images/$file_name
	fi
	echo "$file_name"
}

case $style
in light )
	progress_colors='#5dbded #106691'
	text_color='#e0e0e0'
;; dark ) # doesn't look good on black background
	progress_colors='#5dbded #4d4d4d'
	text_color='#4d4d4d'
;; white )
	progress_colors='#f0f0f0 #808080'
	text_color='#ffffff'
esac

#check_file "$logo_file"

make_logo "${logo_file}"

# logo/banner size
[[ $( convert images/"${logo_file}" -identify /dev/null ) =~ [[:space:]]([0-9]+)x([0-9]+)[[:space:]] ]] ||
	err "Unable to determine banner image size"
logo_w=${BASH_REMATCH[1]}
logo_h=${BASH_REMATCH[2]}

# progress bar length
progress_h=$logo_h

case $color
in blue )
	read anim_start_file anim_stop_file < <( make_anims $color '#0a3f5a' )
	make_separator separator-$color.png '#2979a2' '#5dbded'
;; white )
	read anim_start_file anim_stop_file < <( make_anims $color '#404040' )
	make_separator separator-$color.png '#e0e0e0' '#ffffff'
esac

make_separator separator-red.png '#a22929' '#ed5d5d'

make_helpers

mkdir $theme_name
cd    $theme_name
mkdir images

INDENT='  '

svc_format=$INDENT
for f in icon $work_dir/some-long-file-name 9999 9999 svc_inactive_start fbsplash-dummy 'blendout(9999)'; do
	svc_format+="%-${#f}s "
done
svc_format+='\n'

# args: <rel-path>
add_link() {
	[[ -h $1 ]] && return 0
	#check_file "$1"
	ln -sT ${share_dir}/"$1" "$1"
}

# args: <prefix> <file> [<arg>...]
add_image() {
	local prefix=$1 file=$2
	shift 2
	add_link images/"$file"
	echo "${prefix}images/${file}" "${@}"
}

add_separator_red() {
	printf "$svc_format" $( add_image "icon " separator-red.png $separator_x $separator_y svc_stop_failed fbsplash-dummy )
	printf "$svc_format" $( add_image "icon " separator-red.png $separator_x $separator_y svc_start_failed fbsplash-dummy )
}

add_icon_bar() {
	local cover cover_a50 n icon_x stat_icon_x
	cover=$( add_image "icon " cover.png )
	#cover_a50=$( add_image "icon " cover-a50.png )
	for (( n=1; n<=icon_count; n++ )); do
		icon_x=$(( icon_bar_x + (n-1) * icon_step ))
		stat_icon_x=$(( icon_x + icon_size/2 ))
		printf "$svc_format" icon ${work_dir}/svc_${n}_stop  $icon_x $icon_bar_y
	#	printf "$svc_format" icon ${work_dir}/svc_${n}       $icon_x $icon_bar_y svc_inactive_start _icon_svc_${n}
	#	printf "$svc_format" $cover_a50                      $icon_x $icon_bar_y svc_inactive_start _icon_svc_${n}
		printf "$svc_format" icon ${work_dir}/cover-stop     $icon_x $icon_bar_y svc_stop         _icon_svc_${n} #'blendin(125)'
		printf "$svc_format" icon ${work_dir}/stop      $stat_icon_x $icon_bar_y svc_stop         _icon_svc_${n}
		printf "$svc_format" $cover                          $icon_x $icon_bar_y svc_stopped      _icon_svc_${n} #'blendin(125)'
		printf "$svc_format" icon ${work_dir}/svc_${n}_stop  $icon_x $icon_bar_y svc_stop_failed  _icon_svc_${n}
		printf "$svc_format" icon ${work_dir}/cover-fail     $icon_x $icon_bar_y svc_stop_failed  _icon_svc_${n} #'blendin(125)'
		printf "$svc_format" icon ${work_dir}/fail      $stat_icon_x $icon_bar_y svc_stop_failed  _icon_svc_${n}
		printf "$svc_format" icon ${work_dir}/svc_${n}_start $icon_x $icon_bar_y svc_start        _icon_svc_${n}
		printf "$svc_format" icon ${work_dir}/cover-start    $icon_x $icon_bar_y svc_start       _icon_svc_${n} #'blendout(125)'
		printf "$svc_format" icon ${work_dir}/start     $stat_icon_x $icon_bar_y svc_start        _icon_svc_${n}
		printf "$svc_format" icon ${work_dir}/svc_${n}_start $icon_x $icon_bar_y svc_started      _icon_svc_${n}
		printf "$svc_format" icon ${work_dir}/svc_${n}_start $icon_x $icon_bar_y svc_start_failed _icon_svc_${n}
		printf "$svc_format" icon ${work_dir}/cover-fail     $icon_x $icon_bar_y svc_start_failed _icon_svc_${n} #'blendin(125)'
		printf "$svc_format" icon ${work_dir}/fail      $stat_icon_x $icon_bar_y svc_start_failed _icon_svc_${n}
		echo
	done
}

add_link $font_file

for screen_size; do
	# screen size
	screen_w="${screen_size%x*}"
	screen_h="${screen_size#*x}"

	silent_background=$( cd .. && make_silent )

	case $color
	in blue  ) verbose_background=$( cd .. && make_verbose $verbose_flavour blue '#051e2a' )
	;; white ) verbose_background=$( cd .. && make_verbose $verbose_flavour white '#1e1e1e' )
	esac

	# fixed point for placement
	anchor_x=$(( screen_w / 2 ))
	anchor_y=$(( screen_h / 2 ))

	# separator postion
	separator_x=$(( anchor_x - separator_w/2 ))
	separator_y=$(( anchor_y - separator_h/2 ))

	# icon bar
	icon_bar_w=$(( separator_w - icon_size ))
	icon_bar_x=$(( anchor_x - icon_bar_w/2 ))
	icon_bar_y=$(( separator_y + 20 ))
	icon_step=$(( icon_size*3/2 ))
	icon_count=$(( ( icon_bar_w + icon_step - icon_size ) / icon_step ))

	# main area (logo image + progress bar)
	main_w=$(( logo_w + 20 + progress_w ))

	# status message font size
	status_text_font_size=${font_size}

	# estimated height of 1000 lines of text
	status_text_h_1000=$(( 15600 * status_text_font_size / 12 ))

	# status message text heigth
	status_text_h=$(( status_text_h_1000/1000 ))

	# status message bar
	status_h=$(( status_text_h + 20 ))
	status_x=$(( anchor_x - main_w/2 ))
	status_y=$(( separator_y - separator_h/2 - status_h ))

	# status message text position
	status_text_x=$(( status_x + 15 ))
	status_text_y=$(( status_y + status_h/2 - status_text_h/2 ))

	# logo/banner position
	logo_x=$(( anchor_x - main_w/2 ))
	logo_y=$(( status_y - logo_h  ))

	# progress bar position
	progress_x=$(( anchor_x + main_w/2 - progress_w ))
	progress_y=$logo_y

	# progress bar bottom right corner
	progress_x2=$(( anchor_x + main_w/2 - 1 ))
	progress_y2=$(( progress_y + progress_h - 1 ))

	# message log
	message_log_x=$(( status_text_x      ))
	message_log_y=$(( icon_bar_y + icon_size + 20 ))
	message_log_font_size=${font_size}
	# estimated height of 1000 lines of text
	message_log_text_h_1000=$(( 15600 * message_log_font_size / 12 ))

	#echo "  Message log y is ${message_log_y}"

	# number of message log lines
	message_log_lines=$(( 1000 * ( screen_h - message_log_y - 10 ) / message_log_text_h_1000 ))

	#echo "  Number of msglog textbox lines icon_size ${message_log_lines}"

	{
		echo
		add_image "pic=" $verbose_background

		cat <<EOT

bgcolor=0
tx=0
ty=0
tw=$screen_w
th=$screen_h

EOT
		add_image "silentpic=" $silent_background
		echo
		add_image "icon " $logo_file $logo_x $logo_y
		cat <<EOT

text_font=$font_file
text_size=$status_text_font_size
text_x=$status_text_x
text_y=$status_text_y
text_color=$text_color

EOT
		add_image "icon " separator-$color.png $separator_x $separator_y
		cat <<EOT

# This type is used by fbcondecor_helper in initcpio
<type other>
</type>

<type bootup>
EOT
		add_image "${INDENT}anim loop " $anim_start_file $progress_x $progress_y "blendin(125)"
		cat <<EOT
  box silent inter $progress_x $progress_y2 $progress_x2 $progress_y2 $progress_colors $progress_colors blendin(125)
  box silent       $progress_x $progress_y $progress_x2 $progress_y2 $progress_colors $progress_colors blendin(125)
</type>

<type reboot shutdown>
EOT
		add_image "${INDENT}anim loop " $anim_stop_file $progress_x $progress_y
		cat <<EOT
  box silent inter $progress_x $progress_y $progress_x2 $progress_y2 $progress_colors $progress_colors
  box silent       $progress_x $progress_y2 $progress_x2 $progress_y2 $progress_colors $progress_colors
</type>

<type suspend>
  box silent       $progress_x $progress_y $progress_x2 $progress_y2 #0a3f5a
  box silent inter $progress_x $progress_y $progress_x2 $progress_y2 $progress_colors $progress_colors
  box silent       $progress_x $progress_y2 $progress_x2 $progress_y2 $progress_colors $progress_colors
</type>

<type bootup reboot shutdown suspend>
EOT
		add_separator_red
		echo
		(( icon_count > 0 )) && add_icon_bar
		cat <<EOT
</type>

# 'tuxoniceui_fbsplash' (version 1.0) doesn't know anything about types.
# It seems to show allways simply the last item defined on top.
# With this one at the end we allways get an upward growing progress
# whether suspend or resume it done.
<type resume>
  box silent       $progress_x $progress_y $progress_x2 $progress_y2 #0a3f5a
  box silent inter $progress_x $progress_y2 $progress_x2 $progress_y2 $progress_colors $progress_colors
  box silent       $progress_x $progress_y $progress_x2 $progress_y2 $progress_colors $progress_colors
</type>

EOT
		if (( message_log_lines < 3 )); then
			msg "WARNING: Not including message log."
		else
		cat <<EOT
log_lines=$message_log_lines
# Don't truncate log messages - We only show errors here and don't use a mono spaced font
log_cols=9999
<textbox>
  text silent $font_file $message_log_font_size $message_log_x $message_log_y $text_color msglog
</textbox>

EOT
		fi
	} >${screen_size}.cfg
done

cat > metadata.xml <<EOF
<?xml version="1.0" encoding=\"UTF-8\"?>
<thememeta xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://fbsplash.berlios.de/schemas/1.0/thememeta.xsd">
  <name>${theme_name}</name>
  <version>${version}</version>
  <author>
    <name>${author_name}</name>
    <email>${author_email}</email>
  </author>
  <description>${description}</description>
  <license>${theme_license}</license>
  <url>${url}</url>
</thememeta>
EOF

# EOF #
