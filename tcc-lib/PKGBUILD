# Packager : Dwight Schauer <dschauer@gmail.com>
pkgname=tcc-lib
_pkgname=tcc
pkgver=0.9.25
pkgrel=1
pkgdesc="Tiny C Compiler -- shared library version of libtcc."
arch=('i686' 'x86_64')
depends=(tcc)
url="http://bellard.org/tcc/"
license=('LGPL')
provides=("${pkgname}=${pkgver}")
source=(http://download.savannah.nongnu.org/releases/tinycc/${_pkgname}-${pkgver}.tar.bz2)
options=(docs)
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  
  ./configure --prefix=/usr
  make clean
  make CFLAGS="-fPIC" libtcc.o || return 1
  ld -shared -soname libtcc.so -o libtcc.so libtcc.o || return 1
  install -D -m 755 libtcc.so ${pkgdir}/usr/lib/libtcc.so

}
md5sums=('991c2a1986cce15f03ca6ddc86ea5f43')
