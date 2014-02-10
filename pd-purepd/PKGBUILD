# Maintainer:  Em Ludek <ludek.me@gmail.com>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-purepd
_pkg=purepd
pkgver=0.1.1
pkgrel=1
pkgdesc="Pure Data: native implementations of externals"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
source=(http://download.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz)
md5sums=('128eaa8e8c57cef7c49223ad3657142a')

build() {
  cd $srcdir/$_pkg-$pkgver
  sed -i 's|usr/local|usr|g' Makefile
  sed -i 's|pd-externals|pd/extra|g' Makefile
  make
}

package() {
  cd $srcdir/$_pkg-$pkgver
  make DESTDIR=$pkgdir/ install
}

