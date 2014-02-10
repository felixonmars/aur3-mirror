# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-pan
_pkg=pan
pkgver=0.1.2
pkgrel=1
pkgdesc="A Pure Data library of stereo panning algorithms from various sources"
arch=('any')
url="http://www.puredata.info"
license=('GPL2')
depends=('pd')
source=("http://downloads.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('5825529a98147d63c7c1c79b0a480ce0')

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

