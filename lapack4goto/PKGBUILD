# Maintainer: gborzi <gborzi@ieee.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Jason Taylor <jftaylor21@gmail.com>

pkgname=lapack4goto
_pkgname=lapack
pkgver=3.4.1
pkgrel=1
url="http://www.netlib.org/lapack"
pkgdesc="Linear Algebra PACKage for Goto BLAS"
depends=('gotoblas2')
provides=("lapack=$pkgver")
conflicts=('lapack')
makedepends=('gcc-fortran')
arch=('i686' 'x86_64')
license=("custom")
source=(http://www.netlib.org/${_pkgname}/${_pkgname}-${pkgver}.tgz
        Makefile.lapack
        LICENSE.blas)
md5sums=('44c3869c38c8335c2b9c2a8bb276eb55'
         'b8a5d495bdc34614d6aa6370759d0d5e'
         '38b6acb8ed5691d25863319d30a8b365')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp -f INSTALL/make.inc.gfortran make.inc
  cp -f "${srcdir}/Makefile.lapack" SRC/Makefile

  export FC=gfortran

  pushd INSTALL
  make clean
  make NOOPT="${CFLAGS/-O?/-O0} -fPIC" OPTS="${CFLAGS} -fPIC"
  popd
  # make sure no files with '_', *vxx.o *vfx.o and *2.O as defined in *ASRC
  #  are in OBJS
  pushd SRC
  make clean
  
  make NOOPT="${CFLAGS} -fPIC" OPTS="${CFLAGS} -fPIC" shared
  cp liblapack.so.${pkgver} "${srcdir}/${_pkgname}-${pkgver}/"
  popd
}

check() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   ln -s liblapack.so.${pkgver} liblapack.so
   ln -s liblapack.so.${pkgver} liblapack.so.3
   make OPTS="${CFLAGS}" tmglib
   cd TESTING
   sed -i -e 's_../$(LAPACKLIB)__'  Makefile
   sed -i -e 's_../../$(LAPACKLIB)__'  LIN/Makefile
   sed -i -e 's_../../$(LAPACKLIB)__'  EIG/Makefile
   export LD_LIBRARY_PATH="${srcdir}/${_pkgname}-${pkgver}"
   make -j1 BLASLIB="-L${srcdir}/${_pkgname}-${pkgver} -llapack -lblas"
}

package() {
  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 "${srcdir}/${_pkgname}-${pkgver}/liblapack.so.${pkgver}" \
    "${pkgdir}/usr/lib/"
  ln -sf liblapack.so.${pkgver} "${pkgdir}/usr/lib/liblapack.so"
  ln -sf liblapack.so.${pkgver} "${pkgdir}/usr/lib/liblapack.so.3"

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
