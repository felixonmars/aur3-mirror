#!/bin/sh
echo 'Entering ~/.quine-relay'
mkdir -p ~/.quine-relay
cp -r /usr/share/quine-relay/* ~/.quine-relay
cd ~/.quine-relay
time make
