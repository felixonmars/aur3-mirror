# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=sndpeek
pkgver=1.4
pkgrel=1
pkgdesc="A real-time audio visualization."
arch=('i686' 'x86_64')
url="http://soundlab.cs.princeton.edu/software/sndpeek/"
license=('GPL')
depends=('libsndfile' 'libxmu' 'freeglut' 'glu')
source=(${url}files/$pkgname-$pkgver.tgz)
md5sums=('91df9f339230fd6c01f85ebd4cca51cb')

prepare() {
  cd $pkgname-$pkgver/src/$pkgname

  # DSO link fix - pthread
  sed -i 's/^LIBS.*/& -lpthread/' makefile.alsa

  # missing include
  sed '30i #include "stdlib.h"' -i ../marsyas/LPC.cpp
}

build() {
  cd $pkgname-$pkgver/src/$pkgname
  make -f makefile.alsa
}

package() {
  cd $pkgname-$pkgver/src/$pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
