pkgname=gmp4
pkgver=4.3.2
pkgrel=2
pkgdesc="Legacy version of gmp. Provides 'libgmp.so.3'."
arch=('i686' 'x86_64')
url="http://gmplib.org/"
depends=('glibc')
optdepends=('gmp')
license=('LGPL3')
options=('!libtool' '!buildflags')
source=(ftp://ftp.gmplib.org/pub/gmp-${pkgver}/gmp-${pkgver}.tar.xz)
md5sums=('f3ef2901b603ab09a5d0f46fe1b83479')
 
prepare(){
  cd "${srcdir}/gmp-${pkgver}"
  #Put gmp.h in the same folder as gmpxx.h
  sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile.in
}
 
build() { 
  cd "${srcdir}/gmp-${pkgver}"
  ./configure --prefix=/usr --enable-cxx
  make DESTDIR="${srcdir}/installed" install || return 1
}

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp -a "${srcdir}/installed/usr/lib/"libgmp.so.3* "${pkgdir}/usr/lib/" || return 1
} 
