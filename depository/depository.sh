#!/bin/sh

if [ `id -u` != 0 ]; then
  echo "! you don't have correct privilegies; try 'sudo $0'"
  exec sbt.rb --help
else
  exec sbt.rb $*
fi
