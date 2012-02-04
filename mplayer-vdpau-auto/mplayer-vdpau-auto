#!/bin/bash

IAM=$0
FILE="${@: -1}"

#if no input display usage
if [[ -z "$FILE" ]]; then
        echo usage: $0 /path/to/file
        exit
fi

MPLAYER=/usr/bin/mplayer

# Options for all videos: fullscreen
BASIC_OPTS="-fs -zoom -quiet"

# Options for all videos: fullscreen, SPDIF passthrough DTS/AC3
#BASIC_OPTS="-fs -zoom -quiet -ao alsa:device=iec958 -ac hwdts,hwac3,"

# Options for non-HD videos: force aspect to 16x9 (to ensure video fills TV screen)
NOHD_OPTS="-aspect 16:9"

# Options for normal and lowres videos: use XV w/deinterlace filter, force 16x9
LOW_OPTS="-aspect 16:9 -vf yadif=3:1 -pp 0x33 -vo xv"

VWIDTH=$($MPLAYER -identify -vo vdpau -frames 0 "$FILE" | grep ID_VIDEO_WIDTH | cut -c 16-25)
VCODEC=$($MPLAYER -identify -vo vdpau -frames 0 "$FILE" | grep ID_VIDEO_CODEC | cut -c 16-25)

# all following echo commands can be uncommented for debug info
#echo "VIDEO CODEC: $VCODEC"
#echo "VIDEO WIDTH: $VWIDTH"

# Test for codec, if it's supported by VDPAU, set options to use it. Then, check if the video is in HD,
# and if it's not, set non-HD options.
case $VCODEC in
ffh264)
        #echo -e "Playing h.264 file $FILE:\n"
        MPLAYEROPTS="$BASIC_OPTS -vo vdpau -vc ffh264vdpau"
        if [ $VWIDTH -lt 1280 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$MPLAYEROPTS $NOHD_OPTS"
        fi
        if [ $VWIDTH -lt 700 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$BASIC_OPTS $LOW_OPTS"
        fi
        ;;
ffmpeg2)
        #echo -e "Playing MPEG2 file $FILE:\n"
        MPLAYEROPTS="$BASIC_OPTS -vo vdpau -vc ffmpeg12vdpau"
        if [ $VWIDTH -lt 1280 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$MPLAYEROPTS $NOHD_OPTS"
        fi
        if [ $VWIDTH -lt 700 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$BASIC_OPTS $LOW_OPTS"
        fi
        ;;
ffwmv3)
        #echo -e "Playing WMV3 file $FILE:\n"
        MPLAYEROPTS="$BASIC_OPTS -vo vdpau -vc ffwmv3vdpau"
        if [ $VWIDTH -lt 1280 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$MPLAYEROPTS $NOHD_OPTS"
        fi
        if [ $VWIDTH -lt 700 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$BASIC_OPTS $LOW_OPTS"
        fi
        ;;
# VC-1 is largely unsupported by nvidia - uncomment this section if you're sure your card supports it.
ffvc1)
        #echo -e "Playing VC-1 file $FILE:\n"
        MPLAYEROPTS="$BASIC_OPTS -vo vdpau -vc ffvc1vdpau"
        if [ $VWIDTH -lt 1280 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$MPLAYEROPTS $NOHD_OPTS"
        fi
        if [ $VWIDTH -lt 700 ] && [ $VWIDTH != 0 ]; then
                MPLAYEROPTS="$BASIC_OPTS $LOW_OPTS"
        fi
        ;;
*)
        echo -e "Playing normal file $FILE:\n"
        # Use XV and yadif filter with 'normal' (DiVX, XViD, old WMV, etc.) files, and force 16:9
        # -vf filters only seem to work with XV, or at least they don't work w/VDPAU
        MPLAYEROPTS="$BASIC_OPTS $LOW_OPTS"
        ;;
esac

echo "mplayer options are: $MPLAYEROPTS"

$MPLAYER $MPLAYEROPTS "$@"
