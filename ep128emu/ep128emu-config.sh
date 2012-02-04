#!/bin/sh

echo "Installing roms..."
install -Dm644 /usr/share/ep128emu/roms/ep128emu_roms.bin ~/.ep128emu/roms/ep128emu_roms.bin

echo "Configuring ep128emu..."
makecfg

echo "Done"
