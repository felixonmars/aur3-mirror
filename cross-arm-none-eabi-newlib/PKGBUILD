# Maintainer: Matias De la Puente <mfpuente.ar@gmail.com>
# based on 'cross-arm-elf-newlib' by Andreas Messer <andi@surveycorner.de>

pkgname=cross-arm-none-eabi-newlib
pkgver=1.19.0
pkgrel=2
pkgdesc="Newlib is a C library intended for use on embedded systems."
arch=('i686' 'x86_64')
groups=('devel')
url="http://sourceware.org/newlib/"
license=('GPL')
depends=('cross-arm-none-eabi-binutils' 'cross-arm-none-eabi-gcc-base')
options=(!libtool !emptydirs !strip)
source=(ftp://sources.redhat.com/pub/newlib/newlib-${pkgver}.tar.gz)
sha256sums=('4f43807236b2274c220881ca69f7dc6aecc52f14bb32a6f03404d30780c25007')

build() {
 cd ${srcdir}
 
 rm -rf build
 mkdir  build
 cd     build

 export CFLAGS="-O2"

 ../newlib-${pkgver}/configure \
   --target=arm-none-eabi \
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
