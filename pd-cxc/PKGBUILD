# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-cxc
_pkg=cxc
pkgver=0.5.2
pkgrel=1
pkgdesc="A library of Pure Data objects for random numbers and system tools"
arch=('any')
url="http://www.puredata.info"
license=('GPL3')
depends=('pd')
source=(http://downloads.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz)
md5sums=('b61bcaabd018f1e076f4edfd1bf3b17a')

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

