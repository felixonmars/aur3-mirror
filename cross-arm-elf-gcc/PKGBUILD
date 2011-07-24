# Adapted from cross-arm-elf-gcc-base: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Contributor: Andreas Messer <andi@surveycorner.de>

pkgname=cross-arm-elf-gcc
pkgver=4.6.1
pkgrel=1
pkgdesc="The GNU Compiler Collection - Cross compiler for ARM target"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
#an installed libc/newlib is needed for libstdc++ compile
depends=('cross-arm-elf-binutils>=2.21' 'cloog' 'ppl' 'cross-arm-elf-newlib>=1.18.0')
# cross-arm-elf-gcc is an superset of cross-arm-elf-gcc-base
conflicts=('cross-arm-elf-gcc-base')
provides=("cross-arm-elf-gcc-base=${pkgver}")
options=(!libtool !emptydirs !strip zipman docs)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('c57a9170c677bf795bdc04ed796ca491')

build() {
  cd ${srcdir}/gcc-$pkgver

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  rm -rf build
  mkdir build
  cd build

  ../configure --prefix=/usr \
	      --target=arm-elf \
        --disable-nls \
        --enable-languages=c,c++ \
        --enable-multilib \
        --enable-interwork \
	      --with-local-prefix=/usr/lib/cross-arm \
	      --with-as=/usr/bin/arm-elf-as \
        --with-ld=/usr/bin/arm-elf-ld \
	      --with-newlib \
        --with-float=soft \
	      --host=$CHOST \
	      --build=$CHOST 

  make all-gcc all-target-libgcc all-target-libstdc++-v3 || return 1
}

package() {
  cd ${srcdir}/gcc-$pkgver/build

  make DESTDIR=${pkgdir} install-gcc install-target-libgcc install-target-libstdc++-v3 || return 1

  rm -f $pkgdir/usr/share/man/man7/fsf-funding.7*
  rm -f $pkgdir/usr/share/man/man7/gfdl.7*
  rm -f $pkgdir/usr/share/man/man7/gpl.7*
  rm -rf $pkgdir/usr/share/info
  rm -rf $pkgdir/usr/share/gcc-$pkgver

  cp -r  $pkgdir/usr/libexec/* $pkgdir/usr/lib/ && \
  rm -rf $pkgdir/usr/libexec 

}
