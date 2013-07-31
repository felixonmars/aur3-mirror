# $Id$
# Maintainer: JSpaces <jspaces -aT- incentre -d0T- net>
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
sha256sums=('a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33'
            'ff1d303dbea72f6b38f2d712b933531ca3ad5e3362f24cd4a5e4ac5c8325c135')

prepare() {
  cd "$srcdir/$_srcname-$pkgver"
  msg2 "Patching ..."
  # Patch from http://www.linuxfromscratch.org/blfs/view/svn/multimedia/liba52.html
  patch -Np1 -i ${srcdir}/a52dec-0.7.4-build.patch
}

build() {
  cd "$srcdir/$_srcname-$pkgver"

  # add CFLAGS="-fpic" to allow --enable-shared to compile on x86_64
  # disable static library - who needs it  
  # djbfft support enabled
  ./configure --prefix=/usr \
  --enable-shared \
  --disable-static \
  --enable-djbfft \
  CFLAGS="$([ $(uname -m) = x86_64 ] && echo -fPIC)"
  
  make
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  make DESTDIR="$pkgdir" install
  
  msg2 "Installing include file in case it is needed."
  install -m644 liba52/a52_internal.h "$pkgdir"/usr/include/a52dec/
}

# vim:set ts=2 sw=2 et: 
