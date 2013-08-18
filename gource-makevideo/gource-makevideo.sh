#!/bin/bash
echo "gource-makevideo 1.0"
# devel:
#        -c 4
#        -s 0.1
gource --highlight-users -s 0.25 -a 0.1 -1280x720 --output-ppm-stream - | \
	ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - \
	-x264opts "subq=6:partitions=all:8x8dct:me=umh:frameref=5:bframes=3:b_pyramid=normal:weight_b:crf=19" \
	gource.mp4
