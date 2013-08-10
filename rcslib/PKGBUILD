# Maintainer: Christian Bühler <christian@cbuehler.de>
pkgname=rcslib
pkgver=2013.06.26
pkgrel=1
pkgdesc="Real-Time Control Systems Library"
arch=('i686' 'x86_64')
url="http://www.isd.mel.nist.gov/projects/$pkgname"
license=('unknown')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('dc1c0017754a7a77aa1fd75e4e0c0810')
options=('!makeflags')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
