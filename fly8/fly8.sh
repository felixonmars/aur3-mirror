#!/bin/bash

# Copy configuration file to the home directory
if [[ ! -f $HOME/.fly8.ini ]]; then
  cp /usr/share/fly8/fly.ini $HOME/.fly8.ini
fi

# Launch Fly8
fly8bin F/usr/share/fly8 I$HOME/.fly8.ini L$HOME/.fly8.log "$@"
