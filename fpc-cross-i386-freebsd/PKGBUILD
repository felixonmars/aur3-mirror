pkgname=fpc-cross-i386-freebsd
pkgver=2.6.0
pkgrel=1
pkgdesc="Free Pascal cross compiler for FreeBSD i386."
arch=('i686' 'x86_64')
url="http://www.freepascal.org/"
license=('GPL' 'LGPL' 'custom')
depends=('fpc=2.6.0' 'i386-freebsd-binutils')
source=("ftp://ftp.freepascal.org/pub/fpc/dist/$pkgver/source/fpcbuild-$pkgver.tar.gz")
md5sums=('17375e665a4e1311f85812fe2754f609')

build() {
  cd ${srcdir}/fpcbuild-$pkgver/fpcsrc/compiler
  fpcmake -Tall
  cd ../..
  make NOGDB=1 build OS_TARGET=freebsd CPU_TARGET=i386 || return 1
  make NOGDB=1 PREFIX=${pkgdir}/usr crossinstall OS_TARGET=freebsd CPU_TARGET=i386 || return 1
  rm -rf ${pkgdir}/usr/bin
  rm $pkgdir/usr/lib/fpc/2.6.0/ppcross386
}