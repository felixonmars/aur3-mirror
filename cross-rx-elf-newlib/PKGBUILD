# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-newlib' by Andreas Messer <andi@surveycorner.de>

pkgname=cross-rx-elf-newlib
pkgver=1.18.0
pkgrel=1
pkgdesc="Newlib is a C library intended for use on embedded systems."
arch=('i686' 'x86_64')
groups=('devel')
url="http://sourceware.org/newlib/"
license=('GPL')
depends=('cross-rx-elf-binutils' 'cross-rx-elf-gcc-base')
source=(ftp://sources.redhat.com/pub/newlib/newlib-${pkgver}.tar.gz)
md5sums=('3dae127d4aa659d72f8ea8c0ff2a7a20')

build() {
 cd ${srcdir}
 
 rm -rf build
 mkdir  build
 cd     build

 export CFLAGS="-O2"

 ../newlib-${pkgver}/configure \
   --target=rx-elf \
   --prefix=/usr \
   --enable-interwork \
   --enable-multilib \
   --with-gnu-as \
   --with-gnu-ld \
   --disable-nls || return 1

 make || return 1
 make -j1 DESTDIR=${pkgdir} install || return 1

 rm -rf ${pkgdir}/usr/share/info
 return 0
}
