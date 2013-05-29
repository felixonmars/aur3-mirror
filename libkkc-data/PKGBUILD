# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=libkkc-data
pkgver=0.2.0
pkgrel=3
pkgdesc="Language model data package for libkkc"
arch=('i686' 'x86_64')
url="https://bitbucket.org/libkkc"
license=('GPL')
makedepends=('marisa-python2')
changelog=ChangeLog
source=(https://bitbucket.org/libkkc/${pkgname}/downloads/${pkgname}-${pkgver}.tar.xz)
sha1sums=('6bc5601b3ec4c76066255827563b8debb50dd917')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure PYTHON=/usr/bin/python2 --prefix=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
