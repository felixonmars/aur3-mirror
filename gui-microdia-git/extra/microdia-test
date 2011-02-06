#!/bin/sh

# Test the Microdia webcam using MPlayer
export LD_PRELOAD=/usr/lib/libv4l/v4l2convert.so
mplayer tv:// -tv driver=v4l2:width=640:height=480:fps=25:device=/dev/video0 -vo x11
