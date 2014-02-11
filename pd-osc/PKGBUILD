# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-osc
_pkg=OSC
pkgver=0.1
pkgrel=1
pkgdesc="OpenSoundControl for Pure Data"
arch=('any')
url="http://www.puredata.info"
license=('GPL2')
depends=(pd)
source=("http://downloads.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('8fd4a8224ed3aaa329de9472d2696b45')

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
