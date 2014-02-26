# Contributor: Stéphane Gaudreault <stephane.gaudreault@gmail.com>
pkgname=libnpy
pkgver=0.5
pkgrel=2
pkgdesc="A small library that provides simple routines for saving a C or Fortran array to a data file using numpy's own binary format."
arch=('i686' 'x86_64')
url="http://web.maths.unsw.edu.au/~mclean"
license=('MIT')
depends=('python-numpy')
source=(http://web.maths.unsw.edu.au/~mclean/${pkgname}-${pkgver}.tgz)
md5sums=('b070f9cbd02880587ef88d281bffddbd')

build() {
   cd "${srcdir}"/${pkgname}-${pkgver}/src
   make  
   make fortran
   cd ../lib
   gcc -shared -o libnpy.so -Wl,--whole-archive libnpy.a -Wl,--no-whole-archive
}

package() {
   cd "${srcdir}"/${pkgname}-${pkgver}
   install -dm755 "${pkgdir}"/usr
   cp -a lib "${pkgdir}"/usr
   cp -a include "${pkgdir}"/usr/include
}
