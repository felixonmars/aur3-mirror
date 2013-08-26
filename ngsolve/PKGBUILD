# Contributor: mickele <mimocciola@yahoo.com>

pkgname=ngsolve
pkgver=5.1
pkgrel=1
pkgdesc="NGSolve is a general purpose Finite Element Library on top of Netgen"
url="http://www.hpfem.jku.at/ngsolve/"
depends=('tcl' 'gcc-libs')
arch=('i686' 'x86_64')
license=('LGPL')
source=(http://downloads.sourceforge.net/ngsolve/${pkgname}-${pkgver}.tar.gz)
md5sums=('0b72fa32b3ebfe75939c362dd31a1ca2')


prepare() {
  cd "${pkgname}-${pkgver}"

  # clapack.h conflicts with clapack from atlas-lapack    
  mv basiclinalg/clapack.h basiclinalg/ngsolve_clapack.h
  for _FILE in `grep -Rl "clapack.h" *`
  do
	sed -e "s|clapack.h|ngsolve_clapack.h|" \
	    -i ${_FILE}
  done
  # strange, seems a typo error!
  sed -e "s|l      const FEL \& fel = static_cast<const FEL\&> (bfel);|      const FEL \& fel = static_cast<const FEL\&> (bfel);|" \
      -i fem/diffop.hpp
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  (cd "${pkgdir}/usr/lib" && rm -rf *.la)
}

