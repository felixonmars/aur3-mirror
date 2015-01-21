# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Maintainer: bjoern lindig <bjoern.lindig@gmail.com>

pkgname=pd-pdogg
pkgver=0.25
pkgrel=1
pkgdesc="External for PureData"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/pdogg/pdogg-$pkgver.tar.gz)
md5sums=('d0da83511829c46235ca378dbd7b23bf')


build() {
  cd ${srcdir}/pdogg-$pkgver

  sed -i 's|usr/local|usr|g' Makefile
  sed -i 's|pd-externals|pd/extra|g' Makefile

  make
}

package() {
  cd ${srcdir}/pdogg-$pkgver
  make DESTDIR=$pkgdir install
}

