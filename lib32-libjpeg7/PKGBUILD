# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libjpeg7
pkgname=lib32-${_pkgbase}
pkgver=7
pkgrel=3
pkgdesc="Library of JPEG support functions, version 7 (32 bit)"
arch=('x86_64')
url="http://www.ijg.org/"
license=('GPL')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://www.ijg.org/files/jpegsrc.v${pkgver}.tar.gz)
md5sums=('382ef33b339c299b56baf1296cda9785')
 
build() {
  export CC='gcc -m32'
  cd jpeg-${pkgver}
  ./configure --prefix=/usr --enable-shared --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd jpeg-${pkgver}
  make install \
    prefix="${pkgdir}"/usr \
    mandir="${pkgdir}"/usr/share/man \
    libdir="${pkgdir}"/usr/lib32
  rm -rf "${pkgdir}"/usr/{bin,include,share,lib32/libjpeg.so}
  install -d -m 755 "${pkgdir}"/usr/share/licenses/
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
