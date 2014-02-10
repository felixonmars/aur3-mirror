# $Id$
# Maintainer: Em Ludek <ludek.me@gmail.com>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-ggee
_pkg=ggee
pkgver=0.26
pkgrel=3
pkgdesc="A Pure Data library with five sections: control, experimental, filters, gui, and signal"
arch=('i686' 'x86_64')
url="http://www.puredata.info/"
depends=('pd')
license=('GPL2')
source=("http://download.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('e1e272659c9f4aebaf409888cc6c6c5b')

build() {
  cd "$srcdir/$_pkg-$pkgver"
  sed -i 's|usr/local|usr|g' Makefile
  sed -i 's|pd-externals|pd/extra|g' Makefile

  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"
  make DESTDIR=$pkgdir/ install
}
