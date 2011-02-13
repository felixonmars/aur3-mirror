#!/bin/sh

# Use this to start the PCSX2 emulator
if [ -x /opt/pcsx2/pcsx2 ]; then
   cd /opt/pcsx2
   ./pcsx2
else
   echo "Failed to start PCSX2"
   exit 1

