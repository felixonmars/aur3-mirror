# Maintainer: TDY <tdy@archlinux.info>

pkgname=mib
pkgver=1.9.6
pkgrel=1
pkgdesc="An MPI-based I/O benchmark for clusters"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mibtest/"
license=('GPL')
depends=('python2')
makedepends=('gnuplot')
source=(http://downloads.sourceforge.net/mibtest/$pkgname-$pkgver.tar.gz)
md5sums=('6fe1f4cd4c26bb891183fc5852e6fcd5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1i\#include "elan.h"' mpi_wrap.c
  sed -i '1c\#!/usr/bin/env python2' tools/lwatch.py
  ./configure
  make
}

package() {
  cd "$srcdir/${pkgname%-*}-$pkgver"
  make install \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    mandir=/usr/share/man \
    docdir=/usr/share/doc/$pkgname \
    scriptdir=/usr/share/$pkgname
}

# vim:set ts=2 sw=2 et:
