# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-gcc' by Andreas Messer <andi@surveycorner.de>

pkgname=rx-elf-gcc
pkgver=4.8.2
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for Renesas RX target"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
#an installed libc/newlib is needed for libstdc++ compile
depends=('rx-elf-binutils' 'cloog' 'rx-elf-newlib')
# cross-rx-elf-gcc is an superset of cross-rx-elf-gcc-base
conflicts=('rx-elf-gcc-base')
provides=("rx-elf-gcc-base=${pkgver}")
options=(!libtool !emptydirs !strip zipman docs !buildflags)
source=("ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        'var-tracking.patch')
sha512sums=('2a3927481707b3bb7171076b596d9b69084edac82460df6fb35395592dd1e8fc5665577702ca746d5b454dec68b1c4e31b9de6adc9865d482f4b8736ec648b10'
            '24d8f0728f9f06a312e36877cb145d5e8823a67d54d89c8907ad422edede4361af8b570476028f690d8811812f98c8f81dff4af2366e7cc42f06a6841fab455c')

build() {
  cd ${srcdir}/gcc-$pkgver

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  patch -p 1 -i $srcdir/var-tracking.patch

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

  make -j4 all-gcc all-target-libgcc all-target-libstdc++-v3 || return 1
  make DESTDIR=${pkgdir} install-gcc install-target-libgcc install-target-libstdc++-v3 || return 1

  rm -f $pkgdir/usr/share/man/man7/fsf-funding.7*
  rm -f $pkgdir/usr/share/man/man7/gfdl.7*
  rm -f $pkgdir/usr/share/man/man7/gpl.7*
  rm -rf $pkgdir/usr/share/info
  rm -rf $pkgdir/usr/share/gcc-${pkgver}

  cp -r  $pkgdir/usr/libexec/* $pkgdir/usr/lib/ && \
  rm -rf $pkgdir/usr/libexec 

}
