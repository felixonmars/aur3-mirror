# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-unauthorized
_pkg=unauthorized
pkgver=0.1
pkgrel=1
pkgdesc="A Pure Data library of GUI objects and mp3/streaming objects (free version)"
arch=('any')
url="http://www.puredata.info"
license=('GPL2')
depends=('pd')
source=(http://downloads.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz)
md5sums=('b1f6d1e8cf00daf96b4cecba8d541bb7')

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

