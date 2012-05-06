# $Id: PKGBUILD pczhang $
# Maintainer: Peng Zhang <pczhang@gmail.com>
# Contributor: Peng Zhang <pczhang@gmail.com>

pkgname=r-mathlib
pkgver=2.15.0
pkgrel=1
pkgdesc="GNU R standalone mathematics library"
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.r-project.org/')
makedepends=('openjdk6' 'gcc-fortran')
options=('!makeflags')
source=("http://cran.r-project.org/src/base/R-2/R-${pkgver}.tar.gz")
sha1sums=('a633f87fdbd22e8c371971c535ca815e63c297f6')

build() {
   cd ${srcdir}/R-${pkgver}
   ./configure  --prefix=/usr \
		--libdir=/usr/lib \
		--sysconfdir=/etc/R \
		--datarootdir=/usr/share \
		  rsharedir=/usr/share/R/ \
		  rincludedir=/usr/include/R/ \
		  rdocdir=/usr/share/doc/R/ \
                --with-x \
		--enable-R-shlib \
                --with-lapack \
		--with-blas \
                F77=gfortran \
		LIBnn=lib
   cd src/nmath/standalone
   make || return 1
}

package() {
   cd ${srcdir}/R-${pkgver}/src/nmath/standalone
   make DESTDIR="${pkgdir}" install || return 1
}
