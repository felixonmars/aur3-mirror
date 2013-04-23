# Maintainer: quadpl_03 <quadpl_03@yahoo.com>
pkgname=puff
pkgver=1.0
pkgrel=2
pkgdesc="An X program for sight impaired users. Puff is intended for people \
who need text and graphics displayed at a high magnification factor."
arch=('any')
url="http://www.murga-linux.com/puppy/viewtopic.php?t=57345"
license="custom" 
makedepends=('imake')
source=(${pkgname}.tar.bz2 ${pkgname}-makefile-destdir.patch)

build() 
{
  cd ${srcdir}/${pkgname}
  make clean

  patch -Np1 -i ../${pkgname}-makefile-destdir.patch
  make
}

package()
{
  cd ${srcdir}/${pkgname}

  install -d -v -m755 ${pkgdir}/usr/share/X11/app-defaults
  make DESTDIR=${pkgdir} \
       INSTALL_BIN=/usr/bin \
       INSTALL_MAN=/usr/share/man/man1 \
       INSTALL_DEF=/usr/share/X11/app-defaults \
       MANSUFFIX=1 install install.man

  if [[ -e ${pkgdir}/usr/share/man/man1/${pkgname}.man ]]; then
    rm -f ${pkgdir}/usr/share/man/man1/${pkgname}.man
  fi
  install -d -v -m755 ${pkgdir}/usr/share/licenses/${pkgname}
  head -n 18 Puff.h > ${pkgdir}/usr/share/licenses/${pkgname}/TERMS_OF_USE
}
md5sums=('fca9906cd4f0a134aa62a133b6d34db6'
         'b59278507befaad9a7c6286f26d3560d')
