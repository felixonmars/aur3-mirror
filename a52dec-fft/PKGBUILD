# $Id$
# Maintainer: JSpaces <jspaces |aT| incentre |dOt| net>
# contributor: Thomas Baechler <thomas@archlinux.org>
# contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=a52dec-fft
_srcname=a52dec
pkgver=0.7.4
pkgrel=6
pkgdesc="A free Fast Fourier Transformation optimized ATSC A/52 stream decoder."
url="http://liba52.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc' 'libdjbfft')
options=(!libtool)
conflicts=('a52dec')
provides=('a52dec=$pkgver')
source=(http://liba52.sourceforge.net/files/${_srcname}-${pkgver}.tar.gz
        a52dec-0.7.4-build.patch)
md5sums=('caa9f5bc44232dc8aeea773fea56be80'
         '74ec489441551acc2422d00aa4e777fa')

build() {
  cd ${srcdir}/${_srcname}-${pkgver}
  
  # Update patch
  patch -Np1 -i ${srcdir}/a52dec-0.7.4-build.patch

  # This now causes the build to fail
  #./bootstrap

  # add CFLAGS="-fpic" to allow --enable-shared to compile on x86_64
  # disable static library - who needs it
  # from http://www.linuxfromscratch.org/blfs/view/svn/multimedia/liba52.html
  # djbfft support enabled

  ./configure --prefix=/usr \
  --enable-shared \
  --disable-static \
  --enable-djbfft \
  CFLAGS="$([ $(uname -m) = x86_64 ] && echo -fPIC)"
  
  make
}

package() {
  cd ${srcdir}/${_srcname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  # Copy header file in case needed.
  install -m644 liba52/a52_internal.h ${pkgdir}/usr/include/a52dec/
}
# vim:set ts=2 sw=2 et: 
