#!/bin/sh

rm ~/.cavestory+/data
mkdir -p ~/.cavestory+/
cd ~/.cavestory+/
if test ! -d data; then
    ln -s /opt/cave_story_plus/data
fi

/opt/cave_story_plus/CaveStory+

