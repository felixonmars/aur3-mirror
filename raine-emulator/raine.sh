#!/bin/sh

# Raine appears to need fonts present with the executable
cd /usr/share/raine
./raine "$@"
cd -

