# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=liborigin1
pkgver=20080225
pkgrel=1
arch=('i686' 'x86_64')
url="http://liborigin.sourceforge.net"
pkgdesc="A library for reading OriginLab OPJ project files"
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/liborigin/liborigin-${pkgver}.tar.gz"
        'gcc46.patch')
md5sums=('5b7c6f22173a9d97c4f0dbec8671ac83'
         'e6db644c95b96735228792f8307d9dd5')

build() {
  cd "${srcdir}/liborigin-${pkgver}"
  patch -p1 -i "${srcdir}"/gcc46.patch
  
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../liborigin-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
