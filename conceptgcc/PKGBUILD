pkgname=conceptgcc
pkgver=4.3.0
pkgrel=1
pkgdesc="ConceptGCC is a derivative of the GNU C++ compiler that implements the ConceptC++ language."
url="http://www.generic-programming.org/software/ConceptGCC/"
license="GPL"
depends=('gmp' 'mpfr')
arch=('i686' 'x86_64')
_rel=alpha-7
install=${pkgname}.install
source=(http://www.generic-programming.org/software/ConceptGCC/files/${pkgname}-${pkgver}-${_rel}.tar.bz2)
md5sums=('e41ea3b49ad17974f2ea3f92d3602852' '541e4831359e54a3f06ddee773814d36')

build() {
  mkdir $startdir/src/${pkgname}-build
  cd $startdir/src/${pkgname}-build
  
  ../${pkgname}-${pkgver}-${_rel}/configure --program-transform-name='s/^g++$/conceptg++/' --prefix=/opt/${pkgname} --enable-languages=c++
  make || return 1
  make prefix=$startdir/pkg/opt/${pkgname} install || return 1
}
