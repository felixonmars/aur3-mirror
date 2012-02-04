#!/bin/bash
cd /opt/torrent-episode-downloader
if [ -e /usr/lib/jni/libtray.so ]; then
   java -Djava.library.path=/usr/lib/jni -jar ted.jar
else
   java -Djava.library.path=/usr/lib/jni -jar ted.jar noTray
fi
