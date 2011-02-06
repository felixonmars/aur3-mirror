#!/bin/bash
#

help() {
cat <<EOF
flv2x264 version 0.1 2007 | 3ED <kas1987@o2.pl>

Usage:
 flv2x264 [-v <v-br>][-a <a-br>][-o <output>] -i <input>
 flv2x264 -h (or) -V

Options:
 -v   video bitrate [default=280]
 -a   audio bitrate [default=64]
 -o   output avi file
 -i   input flv file

 -h   show help options
 -V   more info about this program

EOF
exit $1
}

about() {
cat <<EOF
flv2x264 version 0.1 2007 | 3ED <kas1987@o2.pl>

This program may be freely redistributed under
the terms of the GNU General Public License 2.

Please, send me message about bug in this script.

EOF
exit 0
}

while getopts ":v:a:i:o:V" options; do
  case $options in
    v ) optsv="$OPTARG";;
    a ) optsa="$OPTARG";;
    i ) optsi="$OPTARG";;
    o ) optso="$OPTARG";;
		V ) about;;
    h ) help 0;;
    \? ) help 1;;
    * ) help 1;;

  esac
done
[[ -z $optsi ]] && help 1 # exit 1 ;-)

[[ -z $optsv ]] && optsv="280"
[[ -z $optsa ]] && optsa="64"
[[ -z $optso ]] && optso="${optsi}2x264.avi"

mencoder "$optsi" -oac mp3lame -lameopts vbr=3:br=$optsa -ovc x264 -x264encopts trellis=2:threads=auto:bitrate=$optsv -vf hqdn3d -o "$optso"
