# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=sndpeek-jack
pkgver=1.4
pkgrel=1
pkgdesc="A real-time audio visualization using JACK."
arch=('i686' 'x86_64')
url="http://soundlab.cs.princeton.edu/software/sndpeek/"
license=('GPL')
depends=('jack' 'libxmu' 'freeglut' 'glu')
source=(${url}files/sndpeek-$pkgver.tgz)
md5sums=('91df9f339230fd6c01f85ebd4cca51cb')

prepare() {
  cd sndpeek-$pkgver/src/sndpeek

  # enable rtaudio jack
  sed -i 's/^CFLAGS.*/& -D__UNIX_JACK__/' makefile.jack

  # missing include
  sed '30i #include "stdlib.h"' -i ../marsyas/LPC.cpp
}

build() {
  cd sndpeek-$pkgver/src/sndpeek
  make -f makefile.jack
}

package() {
  cd sndpeek-$pkgver/src/sndpeek
  install -Dm755 sndpeek "$pkgdir/usr/bin/$pkgname"
}
