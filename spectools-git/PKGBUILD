# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=spectools-git
pkgver=20130519
pkgrel=1
pkgdesc='A set of utilities for using various spectrum analyzer hardware.'
arch=('i686' 'x86_64')
url='http://www.kismetwireless.net/spectools/'
license=('GPL2')
depends=('libusb-compat' 'gtk2')
provides=('spectools')
makedepends=('git')
source=('git+https://www.kismetwireless.net/spectools.git')
md5sums=('SKIP')

_gitname=spectools

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
