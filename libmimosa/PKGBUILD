# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=libmimosa
pkgver=0.9.0
pkgrel=1
pkgdesc="Mimosa is a high level framework for stream and network programming"
arch=('i686' 'x86_64')
url="http://github.com/abique/mimosa"
license=('MIT')
makedepends=('cmake>=2.8' 'gtest')
depends=('gnutls' 'protobuf')
options=()
source=("https://github.com/downloads/abique/mimosa/mimosa-${pkgver}.tar.xz")
md5sums=('fdfcf8c671f74349b15dbfab19bb17ac')

build() {
  cd ${srcdir}/mimosa-${pkgver} &&
  mkdir build &&
  cd build &&
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. &&
  make &&
  make check
}

package() {
  cd ${srcdir}/mimosa-${pkgver}/build &&
  DESTDIR=${pkgdir} make install
}
