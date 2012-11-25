# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Andrea 'dedalus' Turconi <andy.dedalus@gmail.com>
# lazork

pkgname=freefem
pkgver=3.20
_pkgver=3.20
pkgrel=1
pkgdesc="A PDE oriented language using the finite element method"
arch=('i686' 'x86_64')
url="http://www.freefem.org/ff++/index.htm"
license=('LGPL')
depends=('arpack' 'fftw' 'freeglut')
makedepends=('gcc-fortran' 'wget')
source=("http://www.freefem.org/ff++/ftp/${pkgname}++-${_pkgver}.tar.gz"
        "disable-doc.patch")
md5sums=('6f699e90aa50a84bf7eb09f99d1989b2'
         '5d3e48e641cb0b067855077c94ee45da')

build() {
  cd "${srcdir}/${pkgname}++-${_pkgver}"

  sed -i "1i#include <unistd.h>" src/Graphics/getprog-unix.hpp
  patch -Np1 -i ../disable-doc.patch

  ./configure \
    --prefix=/usr \
    --enable-download
  make
}

package() {
  cd "${srcdir}/${pkgname}++-${_pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install documentation
  install -Dm644 DOC/freefem++doc.pdf "${pkgdir}/usr/share/doc/${pkgname}/freefem++doc.pdf"
}
