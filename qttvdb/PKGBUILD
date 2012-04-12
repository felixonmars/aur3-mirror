# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=qttvdb
pkgver=0.4.0
pkgrel=1
pkgdesc='Library to use thetvdb.com XML API with Qt.'
arch=('i686' 'x86_64')
url='http://xf.iksaif.net/dev/qttvdb.html'
license=('LGPL')
depends=('qt')
makedepends=('cmake')
source=("http://xf.iksaif.net/dev/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('59d17812284e20946d458a576f6ad622')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
}

