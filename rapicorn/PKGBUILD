# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=rapicorn
pkgver=14.10.0
pkgrel=1
pkgdesc="A toolkit for rapid development of graphical user interfaces using C++ and Python"
arch=(i686 x86_64)
url="http://rapicorn.testbit.eu/"
license=('LGPL')
depends=('python2' 'gdk-pixbuf2' 'libpng12' 'libxml2' 'pango')
source=("http://dist.testbit.eu/rapicorn/rapicorn-$pkgver.tar.bz2")
md5sums=('304a7e1805ca65d64f0d8769845b45f7')

prepare() {
  cd $pkgname-$pkgver

  # use python 2.7
  export PYTHON=python2 PYTHON_VERSION=2.7

  # python2 shebang
  sed -i "s/env python$/&2/" `find . -name "*.py"`

  # use libpng12
  sed -i "s|png.h|libpng12/&|" ui/pixmap.cc
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
