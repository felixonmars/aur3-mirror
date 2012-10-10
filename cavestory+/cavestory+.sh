#!/bin/sh

mkdir -p ~/.cavestory+/
cd ~/.cavestory+/
if test ! -d data; then
    ln -s /opt/cavestoryplus/data
fi

/opt/cavestoryplus/CaveStory+

