#!/bin/bash

#####################################################
# This program is licensed under GPL v2 only        #
# See LICENSE for more details                      #
#####################################################

source /etc/makepkg.conf


function GetCorePkgs {
  if [ "${PACKAGES}" ]; then
    cat ${PACKAGES}
  else
    pacman -Sql core
  fi
}

function BootstrapCore {
  COREPKGS=$(GetCorePkgs)

  mkdir -p ${TMPROOT}/var/lib/pacman/
  mkdir -p ${TMPROOT}/dev
  mkdir -p ${TMPROOT}/etc
  mount --bind /dev ${TMPROOT}/dev
  echo "[core]" > ${TMPROOT}/etc/pacman.conf.bootstrap
  echo "Server = $MIRROR" >> ${TMPROOT}/etc/pacman.conf.bootstrap
  echo "[extra]" >> ${TMPROOT}/etc/pacman.conf.bootstrap
  echo "Server = $MIRROR" >> ${TMPROOT}/etc/pacman.conf.bootstrap
  pacman -Sy --verbose --root ${TMPROOT}  --config ${TMPROOT}/etc/pacman.conf.bootstrap --noconfirm --cachedir ${PKGCACHE}
  pacman -S $COREPKGS  --cachedir ${PKGCACHE} --root ${TMPROOT}/ --config ${TMPROOT}/etc/pacman.conf.bootstrap
  umount ${TMPROOT}/dev
  rm ${TMPROOT}/etc/pacman.conf.bootstrap
}

function DisplaySyntax {
  echo 'Usage: archbootstrap-ee --target=<dir> [--arch=<arch>] [--mirror=<url>] [--pkgcache=<dir>] [--packages=<file>]'
  exit 1
}

if [ "$(whoami)" != "root" ]; then
  echo "You need to be root."
  exit 1
fi

echo "Archbootstrap-ee 0.5"
echo "Bootstraps a new Arch Linux system."
echo

TARCH=$(uname -m)
TMPROOT=""
MIRROR=""
PKGCACHE=""
PACKAGES=""

for i in $@; do
  if [ ${i/--arch/} != $i ]; then
    TARCH=${i/--arch=/}
  fi
  if [ ${i/--target/} != $i ]; then
    TMPROOT=${i/--target=/}
  fi
  if [ ${i/--mirror/} != $i ]; then
    MIRROR=${i/--mirror=/}
  fi
  if [ ${i/--pkgcache/} != $i ]; then
    PKGCACHE=${i/--pkgcache=/}
  fi
  if [ ${i/--packages/} != $i ]; then
    PACKAGES=${i/--packages=/}
  fi
done

[ "$1" == "--help" ] && DisplaySyntax
[ -z "${TARCH}" ] && DisplaySyntax
[ -z "${TMPROOT}" ] && DisplaySyntax
[ -z "${MIRROR}" ] && MIRROR="ftp://ftp.archlinux.org/\$repo/os/$TARCH"


if [ -z "${PKGCACHE}" ]; then
  if [ "${CARCH}" == "${TARCH}" ]; then
    PKGCACHE=/var/cache/pacman/pkg
  else 
    if [ "${TARCH}" == "i686" ]; then
      PKGCACHE=/var/cache/pacman/pkg32
    fi
    if [ "${TARCH}" == "x86_64" ]; then
      PKGCACHE=/var/cache/pacman/pkg64
    fi
  fi
  if [ -z "${PKGCACHE}" ]; then
    echo "Archbootstrap does not support this host/target architecture."
    exit 1
  fi
fi


echo "Bootstrap summary:"
echo "Host architecture: $CARCH"
echo "Target architecture: $TARCH"
echo "Target directory: $TMPROOT"
echo "Mirror: $MIRROR"
echo "Package cache directory: $PKGCACHE"
[ "${PACKAGES}" ] && echo "Package list: ${PACKAGES}"

BootstrapCore
