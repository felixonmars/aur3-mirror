#!/bin/bash
if [ $(whoami) == 'root' ]
then
  /usr/share/pyminifakedns/pyminifakedns.py
else
  echo "You need to be root in order to run pyminifakedns."
fi
