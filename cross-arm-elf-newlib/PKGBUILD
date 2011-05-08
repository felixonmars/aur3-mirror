# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Maintainer: Andreas Messer <andi@surveycorner.de>

pkgname=cross-arm-elf-newlib
pkgver=1.19.0
pkgrel=2
pkgdesc="Newlib is a C library intended for use on embedded systems."
arch=('i686' 'x86_64')
groups=('devel')
url="http://sourceware.org/newlib/"
license=('GPL')
depends=('cross-arm-elf-binutils' 'cross-arm-elf-gcc-base')
source=(ftp://sources.redhat.com/pub/newlib/newlib-${pkgver}.tar.gz)
md5sums=('0966e19f03217db9e9076894b47e6601')
options=(!libtool !emptydirs !strip)

build() {
 cd ${srcdir}
 
 rm -rf build
 mkdir  build
 cd     build

 export CFLAGS="-O2"

 ../newlib-${pkgver}/configure \
   --target=arm-elf \
   --prefix=/usr \
   --enable-interwork \
   --enable-multilib \
   --with-gnu-as \
   --with-gnu-ld \
   --with-float=soft \
   --disable-nls || return 1

 make || return 1
 make -j1 DESTDIR=${pkgdir} install || return 1

 rm -rf ${pkgdir}/usr/share/info
 return 0
}
