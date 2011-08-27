# $Id: PKGBUILD 34513 2009-04-09 21:32:12Z ronald $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: twa022 <twa022@gmail.com>

pkgname=fftw-threads
_pkgname=fftw
pkgver=3.2.2
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.fftw.org/"
depends=('glibc' 'bash')
makedepends=('gcc-fortran')
options=(!libtool)
source=(http://www.fftw.org/${_pkgname}-${pkgver}.tar.gz)
install=fftw.install
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")

# notes:
# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  
 # build & install double precision
  ./configure F77=gfortran --prefix=/usr \
   --enable-double --enable-shared --enable-threads \
   || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  make clean 

  # build & install long double precission
  ./configure F77=gfortran --prefix=/usr \
   --enable-long-double --enable-shared --enable-threads \
   || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  make clean

  # build + install single precision
  ./configure F77=gfortran --prefix=/usr \
   --enable-float --enable-shared --enable-threads \
   || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # handle info files
  rm -f $pkgdir/usr/share/info/dir
  gzip $pkgdir/usr/share/info/*
}
md5sums=('b616e5c91218cc778b5aa735fefb61ae')
