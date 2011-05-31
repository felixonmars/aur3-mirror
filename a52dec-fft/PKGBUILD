# Maintainer: JSpaces <jspaces |aT| lightspeed |dOt| ca>
# contributor: Thomas Baechler <thomas@archlinux.org>
# contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=a52dec-fft
_srcname=a52dec
pkgver=0.7.4
pkgrel=5
pkgdesc="A free Fast Fourier Transformation optimized ATSC A/52 stream decoder."
arch=('i686' 'x86_64')
url="http://liba52.sourceforge.net/"
license=('GPL2')
depends=('glibc' 'libdjbfft')
options=(!libtool)
conflicts=('a52dec')
provides=('a52dec=$pkgver')
source=(http://liba52.sourceforge.net/files/${_srcname}-${pkgver}.tar.gz
        a52dec-0.7.4-build.patch)
md5sums=('caa9f5bc44232dc8aeea773fea56be80'
        'fa16f224a7dceb7613824380abef0052')

build() {
  cd ${srcdir}/${_srcname}-${pkgver}
  patch -Np1 -i ${srcdir}/a52dec-0.7.4-build.patch

  # Update auto build files, compile fails otherwise
  ./bootstrap
  
  # djbfft support enabled
  ./configure --prefix=/usr \
  --enable-shared \
  --enable-djbfft
  
  make
}

package() {
  cd ${srcdir}/${_srcname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  # Copy header file in case needed.
  install -m644 liba52/a52_internal.h ${pkgdir}/usr/include/a52dec/
}
# vim:set ts=2 sw=2 et: 
