#!/bin/bash
cd ~/
if [ ! -d ".aioremote" ]; then
  mkdir ".aioremote"
  ln -s "/usr/share/aioremote/AioServer3.4.2_lib" ".aioremote/"
  cp "/usr/share/aioremote/config.ini" ".aioremote/"
fi
cd ".aioremote"
java -jar /usr/share/aioremote/AioServer3.4.2.jar