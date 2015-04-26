# Maintainer: Sebastian Lau <lauseb644@gmail.com>

pkgname=mongoose3
pkgver=3.7
pkgrel=1
pkgdesc="Easy to use, powerful, embeddable web server (release 3)"
arch=('i686' 'x86_64')
url="https://github.com/cesanta/mongoose"
license=(custom)
depends=('openssl')
makedepends=('cmake')
provides=('mongoose3')
source=("mongoose-${pkgver}.tar.gz::https://github.com/cesanta/mongoose/archive/${pkgver}.tar.gz"
        "cmake.patch")
md5sums=('d35448e3b459746a04fb1319fe27755d'
         'd11da216f0ce80d80f07a23b1520ebb7')
options=(staticlibs)

prepare() {
 ## Mongoose does not provide a proper Makefile
  msg2 "Adding makefile for embedded mongoose server"
   cd "${srcdir}/mongoose-${pkgver}"
   [ -e CMakeLists.txt ] && rm -f CMakeLists.txt
   patch CMakeLists.txt < "${srcdir}/cmake.patch"
}


build() {
   cd "${srcdir}/mongoose-${pkgver}"
   cmake .
   make
}
 
package() {

   install -dm755 "${pkgdir}/usr/"{lib,include,share/licenses/"$pkgname"}

   install -Dm644 "${srcdir}/mongoose-${pkgver}/libmongoose3.a" "${pkgdir}/usr/lib/libmongoose3.a"
   install -Dm644 "${srcdir}/mongoose-${pkgver}/mongoose.h" "${pkgdir}/usr/include/mongoose3.h"   
   install -Dm644 "${srcdir}/mongoose-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/mongoose3/LICENSE"
}
