# Maintainer: Aleksuk Artyom <h31mail at yandex.com>
# based on "libktorrent" package

pkgname=libktorrent-devel
pkgver=1.1rc1
pkgrel=1
pkgdesc="A BitTorrent library based on KDE Platform"
arch=('i686' 'x86_64')
url="http://ktorrent.org"
license=('GPL2')
depends=('kdelibs')
makedepends=('automoc4' 'cmake' 'boost')
provides=(libktorrent)
conflicts=(libktorrent)
source=("http://ktorrent.org/downloads/4.1rc1/libktorrent-${pkgver}.tar.bz2")
options=('libtool')
md5sums=('0060a3a83c5e63485bc168d59f33656e')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../libktorrent-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
