# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libcdio-paranoia
pkgname=lib32-$_pkgbase
pkgver=10.2+0.90+1
pkgrel=1
pkgdesc="CD paranoia libraries from libcdio (32 bit)"
arch=('x86_64')
license=('GPL' 'LGPL')
url="http://www.gnu.org/software/libcdio/"
depends=('lib32-libcdio' "$_pkgbase")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/libcdio/${_pkgbase}-${pkgver}.tar.bz2)
md5sums=('e79e196864dd3b1ca87a01345abbda07')

build() {
  export CC='gcc -m32'
  cd "${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --enable-cpp-progs \
      --disable-static --disable-example-progs \
      --libdir=/usr/lib32
  make
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
