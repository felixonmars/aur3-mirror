# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-gcc-base' by Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=rx-elf-gcc-base
pkgver=4.8.2
pkgrel=1
pkgdesc="The GNU Compiler Collection"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('rx-elf-binutils' 'libmpc' 'libelf' 'cloog')
options=(!libtool !emptydirs zipman docs !strip !buildflags)
source=("ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        'var-tracking.patch')
sha512sums=('2a3927481707b3bb7171076b596d9b69084edac82460df6fb35395592dd1e8fc5665577702ca746d5b454dec68b1c4e31b9de6adc9865d482f4b8736ec648b10'
            '24d8f0728f9f06a312e36877cb145d5e8823a67d54d89c8907ad422edede4361af8b570476028f690d8811812f98c8f81dff4af2366e7cc42f06a6841fab455c')

build() {
  cd $srcdir/gcc-$pkgver

  export CFLAGS="-pipe"
  export CXXFLAGS="-pipe"

  patch -p1 -i $srcdir/var-tracking.patch

  [ $NOEXTRACT -eq 1 ] || rm -rf build
  mkdir build
  cd build

  [ $NOEXTRACT -eq 1 ] || ../configure --prefix=/usr \
        --target=rx-elf \
        --host=$CHOST \
        --build=$CHOST \
        --enable-shared --disable-nls --enable-languages=c --enable-multilib \
        --with-local-prefix=/usr/lib/cross-rx \
        --with-as=/usr/bin/rx-elf-as --with-ld=/usr/bin/rx-elf-ld \
        --with-newlib \
        --with-sysroot=/usr/$CHOST/rx-elf

  make -j 4 all-gcc all-target-libgcc || return 1
  make DESTDIR=$pkgdir install-gcc install-target-libgcc || return 1

  rm -f $pkgdir/usr/share/man/man7/fsf-funding.7*
  rm -f $pkgdir/usr/share/man/man7/gfdl.7*
  rm -f $pkgdir/usr/share/man/man7/gpl.7*
  rm -rf $pkgdir/usr/share/info

  cp -r $pkgdir/usr/libexec/* $pkgdir/usr/lib/ && \
  rm -rf $pkgdir/usr/libexec

  # strip it manually
  strip $pkgdir/usr/bin/* 2>/dev/null || true
  find $pkgdir/usr/lib -type f -exec rx-elf-strip {} \; 2>/dev/null || true
}


