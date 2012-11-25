#!/bin/bash -e
. /etc/makepkg.archdroid

tt=arm-unknown-linux-gnueabi
export ROOT=fhs
export SYSROOT=/$ROOT
export CC=$tt-gcc
[ -f "/usr/bin/$tt-g++" ] && export CXX=$tt-g++
export CPP=$tt-cpp
export LD=$tt-ld
export AR=$tt-ar
export AS=$tt-as
export NM=$tt-nm
export STRIP=$tt-strip
export RANLIB=$tt-ranlib
export OBJDUMP=$tt-objdump
export READELF=$tt-readelf

export PKG_CONFIG_DIR=
export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig

# perl devs use this for some weird guesswork
export LANG="C"

# we are cross-compiling, so relying on Bash features is ok
SHELL=/bin/bash
CONFIG_SHELL=/bin/bash

export PATH="/usr/$tt/bin/:$PATH"
export CONFIG_SITE="/usr/share/archdroid/config.site"

export PACMAN_orig=${PACMAN:-pacman}
export PACMAN="pacman-archdroid"
makepkg --config /etc/makepkg.archdroid --ignorearch -p /usr/share/archdroid/PKGBUILD_WRAPPER "$@"
