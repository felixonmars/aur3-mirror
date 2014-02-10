# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-chaos
_pkg=chaos
pkgver=0.2
pkgrel=1
pkgdesc="A set of Pure Data objects to calculate various chaotic attractors"
arch=('any')
url="http://www.puredata.info"
license=('GPL2')
depends=('pd')
source=("http://downloads.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('24144f0789b2ad15259ce2f6bbbcf94e')

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

