# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-gcc' by Andreas Messer <andi@surveycorner.de>

pkgname=cross-rx-elf-gcc
pkgver=4.5.1
pkgrel=1
pkgdesc="The GNU Compiler Collection - Cross compiler for Renesas RX target"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
#an installed libc/newlib is needed for libstdc++ compile
depends=('cross-rx-elf-binutils>=2.18' 'cloog-ppl>=0.15.3' 'cross-rx-elf-newlib>=1.18.0')
# cross-rx-elf-gcc is an superset of cross-rx-elf-gcc-base
conflicts=('cross-rx-elf-gcc-base')
provides=("cross-rx-elf-gcc-base=${pkgver}")
options=(!libtool !emptydirs !strip zipman docs)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('48231a8e33ed6e058a341c53b819de1a')

build() {
  cd ${srcdir}/gcc-$pkgver

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  rm -rf build
  mkdir build
  cd build

  ../configure --prefix=/usr \
	--target=rx-elf \
        --disable-nls \
        --enable-languages=c,c++ \
        --enable-multilib \
        --enable-interwork \
	--with-local-prefix=/usr/lib/cross-rx \
	--with-as=/usr/bin/rx-elf-as \
        --with-ld=/usr/bin/rx-elf-ld \
	--with-newlib \
	--host=$CHOST \
	--build=$CHOST 

  make all-gcc all-target-libgcc all-target-libstdc++-v3 || return 1
  make DESTDIR=${pkgdir} install-gcc install-target-libgcc install-target-libstdc++-v3 || return 1

  rm -f $pkgdir/usr/share/man/man7/fsf-funding.7*
  rm -f $pkgdir/usr/share/man/man7/gfdl.7*
  rm -f $pkgdir/usr/share/man/man7/gpl.7*
  rm -rf $pkgdir/usr/share/info
  rm -rf $pkgdir/usr/share/gcc-4.5.1

  cp -r  $pkgdir/usr/libexec/* $pkgdir/usr/lib/ && \
  rm -rf $pkgdir/usr/libexec 

}
