# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=dcpu-16-hg
_pkgname=dcpu-16
pkgver=95
pkgrel=2
pkgdesc="DCPU-16 assembler and emulator written in C++"
arch=('x86_64' 'i686')
url="http://n.ethz.ch/~vartokb/dcpu.html"
license=('unknown')
depends=('sdl')
makedepends=('mercurial')
optdepends=("python2: one of the examples needs this")

_hgroot="https://bitbucket.org/benedek/dcpu-16"
_hgrepo="dcpu-16"

build() {
  rm -rf build
  cp -rf "${_hgrepo}" build
  cd build

  make clean

  msg "Building the emulator"
  make DATADIR=/usr/share/$_pkgname

  msg "Building the assembler"
  make -C dcasm

  # Build the samples
  msg "Building the samples"
  find samples -name *.asm -exec ./dcasm/dcasm '{}' ';'

  # Install
  msg "Installing files"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "dcasm/dcasm" "$pkgdir/usr/bin/dcasm"
  mkdir -p "$pkgdir/usr/share/$_pkgname"
  cp -r data samples "$pkgdir/usr/share/$_pkgname"
}
