# Maintainer: Roamn Lapin <lampus.lapin@gmail.com>

pkgname=simclist
pkgver=1.6
pkgrel=1
pkgdesc="A high quality C (C++ embeddable) library for handling lists"
url="http://mij.oltrelinux.com/devel/simclist/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake' 'doxygen')
source=("http://mij.oltrelinux.com/devel/simclist/${pkgname}-${pkgver}.tar.bz2")
md5sums=('15d6020287dec73575b0580cb76cd27d')

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver}
  make
  
  # generate doc
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/^CREATE_SUBDIRS.*=.*YES/CREATE_SUBDIRS = NO/' Doxyfile
  doxygen
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m755 "${srcdir}/build/libsimclist.so" "${pkgdir}/usr/lib/libsimclist.so"
  install -D -m644 "simclist.h" "${pkgdir}/usr/include/simclist.h"
  install -D -m644 "Changes" "${pkgdir}/usr/share/doc/${pkgname}/Changes" 
  install -D -m644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp -r "${srcdir}/${pkgname}-${pkgver}/doc/html" "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r "examples" "${pkgdir}/usr/share/doc/${pkgname}/"
}
