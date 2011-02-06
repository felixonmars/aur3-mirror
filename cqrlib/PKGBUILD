# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=cqrlib
pkgver=1.0.3
pkgrel=2
pkgdesc="an ANSI C library for quaternion arithmetic and rotation math"
arch=('i686' 'x86_64')
url="http://cqrlib.sourceforge.net/"
depends=('glibc') 
license=('LGPL')
source=(http://downloads.sourceforge.net/project/cqrlib/cqrlib/CQRlib-$pkgver/CQRlib-$pkgver.tar.gz)
md5sums=('62a02749e85f25afe83449f9010d1cdf')

build() {
  cd $srcdir/CQRlib-$pkgver
  sed -i "s|INSTALLDIR  = \$(HOME)|INSTALLDIR = ${pkgdir}/usr|" ./Makefile
  make clean
  make all || return 1
  make install
# do not install the libtool thing
  rm ${pkgdir}/usr/lib/*.la
}
