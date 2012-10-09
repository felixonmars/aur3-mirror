# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-gcc' by Andreas Messer <andi@surveycorner.de>

pkgname=cross-sh3eb-elf-gcc
pkgver=4.7.2
pkgrel=1
pkgdesc="The GNU Compiler Collection - Cross compiler for Renesas SH targets"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('cross-sh3eb-elf-binutils' 'cloog')
conflicts=()
provides=("cross-sh3eb-elf-gcc-base=${pkgver}")
options=(!libtool !emptydirs !strip zipman docs)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('cc308a0891e778cfda7a151ab8a6e762')

build() {
  cd ${srcdir}/gcc-$pkgver

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  rm -rf build
  mkdir build
  cd build

  ../configure --prefix=/usr \
	--target=sh3eb-elf \
        --disable-nls \
        --enable-languages=c,c++ \
        --enable-multilib \
        --enable-interwork \
	--with-local-prefix=/usr/lib/cross-sh3eb \
	--with-as=/usr/bin/sh3eb-elf-as \
        --with-ld=/usr/bin/sh3eb-elf-ld \
	--host=$CHOST \
	--build=$CHOST 

  make all-gcc all-target-libgcc || return 1
  make DESTDIR=${pkgdir} install-gcc install-target-libgcc || return 1

  rm -f $pkgdir/usr/share/man/man7/fsf-funding.7*
  rm -f $pkgdir/usr/share/man/man7/gfdl.7*
  rm -f $pkgdir/usr/share/man/man7/gpl.7*
  rm -rf $pkgdir/usr/share/info
  rm -rf $pkgdir/usr/share/gcc-4.5.1

  cp -r  $pkgdir/usr/libexec/* $pkgdir/usr/lib/ && \
  rm -rf $pkgdir/usr/libexec 

}
