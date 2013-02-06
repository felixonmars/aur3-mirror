# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-newlib' by Andreas Messer <andi@surveycorner.de>

pkgname=rx-elf-newlib
pkgver=2.0.0
pkgrel=1
pkgdesc="Newlib is a C library intended for use on embedded systems."
arch=('i686' 'x86_64')
groups=('devel')
url="http://sourceware.org/newlib/"
license=('GPL')
depends=('rx-elf-binutils' 'rx-elf-gcc-base')
source=(ftp://sourceware.org/pub/newlib/newlib-${pkgver}.tar.gz
        001-libgloss-rx-destdir.patch)
md5sums=('e3e936235e56d6a28afb2a7f98b1a635'
         '4581c7fdf036e87546e64d723d653282')

build() {
 cd ${srcdir}/newlib-${pkgver}
 patch -p0 < ../001-libgloss-rx-destdir.patch

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

