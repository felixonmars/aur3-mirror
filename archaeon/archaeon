#!/bin/bash
# Archaeon -- Small ABS Building Script
# By Vithon <ratm@archlinux.us>
if [ "$1" = "" ] ; then
	echo "Archaeon v0.3"
	echo "USAGE:"
	echo "`basename $0` [PACKAGE NAME]"
	echo
	exit 0
fi
ABS_PKG_DIR=`find /var/abs -name "$1"`
ROOT_BUILD_DIR="/tmp/archaeon_build"
PKG_DIR="$ROOT_BUILD_DIR/$1/"
echo "[-] Archaeon starting."
if [ "ABS_PKG_DIR" = "" ] ; then
	echo "[-] ERROR: No packages exist with the name '$1'."
	exit 1
fi
echo "[+] Making build directory..."
mkdir -p "$PKG_DIR"
cd "$PKG_DIR"
echo "[+] Copying files..."
rsync -r "$ABS_PKG_DIR/" "$PKG_DIR/"
echo "[+] Building package..."
makepkg &>build.log
if [ ! -e *.pkg.tar.gz ] ; then
	echo "[-] ERROR: $1 package not built. Check $PKG_DIR/build.log."
	exit 1
fi
echo "[+] Installing $1..."
sudo pacman -U *.pkg.tar.gz &>/dev/null
echo "[+] Cleaning up..."
rm -rf $PKG_DIR
echo "[-] Archaeon finished."
