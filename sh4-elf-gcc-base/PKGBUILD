# Maintainer: Daniel YC Lin <dlin.tw at gmail>

pkgname=sh4-elf-gcc-base
pkgver=4.7.2
pkgrel=2
pkgdesc="The GNU Compiler Collection"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('sh4-elf-binutils' 'libmpc' 'libelf')
options=(!libtool !emptydirs zipman docs !strip)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('cc308a0891e778cfda7a151ab8a6e762')

build() {
  cd $srcdir/gcc-$pkgver

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  rm -rf build
  mkdir build
  cd build

  ../configure --prefix=/usr \
	--target=sh4-elf \
	--disable-nls \
	--enable-languages=c,c++ \
	--enable-multilib \
	--enable-interwork \
	--with-local-prefix=/usr/lib/sh4-elf \
	--with-as=/usr/bin/sh4-elf-as \
	--with-ld=/usr/bin/sh4-elf-ld \
	--host=$CHOST \
	--build=$CHOST

#	--enable-shared \
#	--with-newlib \
#	--with-sysroot=/usr/$CHOST/sh4-elf
#	--enable-obsolete \
#	--enable-softfloat \
#	--with-float=soft \

  make all-gcc all-target-libgcc
}

package() {
  cd $srcdir/gcc-$pkgver/build

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  make DESTDIR=$pkgdir install-gcc install-target-libgcc

  rm -f $pkgdir/usr/share/man/man7/fsf-funding.7*
  rm -f $pkgdir/usr/share/man/man7/gfdl.7*
  rm -f $pkgdir/usr/share/man/man7/gpl.7*
  rm -rf $pkgdir/usr/share/info

  cp -r $pkgdir/usr/libexec/* $pkgdir/usr/lib/
  rm -rf $pkgdir/usr/libexec

  # strip it manually
  strip $pkgdir/usr/bin/* 2>/dev/null || true
  find $pkgdir/usr/lib -type f -exec sh4-elf-strip --strip-debug --strip-unneeded {} \; 2>/dev/null || true
}
