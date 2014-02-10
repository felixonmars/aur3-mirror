# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-pddp
_pkg=pddp
pkgver=0.2.1
pkgrel=1
pkgdesc="A collection of Pure Data objects for making documentation easier and more interactive"
arch=('any')
url="http://www.puredata.info"
license=('GPL2')
depends=(pd)
source=("http://download.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('285d8f798c56f2a4a4a02f239368f3f5')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  sed -i 's|usr/local|usr|g' Makefile
  sed -i 's|pd-externals|pd/extra|g' Makefile

  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" install
}
