#!/bin/bash

cd /usr/share/stickynotes
python2 ./stickynotes.py &
disown -a

