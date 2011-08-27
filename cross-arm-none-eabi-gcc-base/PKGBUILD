# Maintainer: Matias De la Puente <mfpuente.ar@gmail.com>
# based on 'cross-arm-elf-gcc-base' by Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=cross-arm-none-eabi-gcc-base
pkgver=4.6.0
pkgrel=1
pkgdesc="The GNU Compiler Collection"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('cross-arm-none-eabi-binutils' 'libmpc' 'libelf' 'cloog' 'ppl')
options=(!libtool !emptydirs zipman docs !strip)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-core-${pkgver}.tar.bz2)
sha256sums=('353191576de3720a643026262a5d198a7f2cf956b0e608a953571a0dcdb0cfc1')

build() {
  cd $srcdir/gcc-$pkgver

  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  [ $NOEXTRACT -eq 1 ] || rm -rf build
  mkdir build
  cd build

  [ $NOEXTRACT -eq 1 ] || ../configure --prefix=/usr \
	--target=arm-none-eabi \
	--host=$CHOST \
	--build=$CHOST \
	--enable-shared --disable-nls --enable-languages=c --enable-multilib \
	--with-local-prefix=/usr/lib/cross-arm \
	--with-as=/usr/bin/arm-none-eabi-as --with-ld=/usr/bin/arm-none-eabi-ld \
	--enable-softfloat \
	--with-float=soft \
	--with-newlib \
	--with-sysroot=/usr/$CHOST/arm-none-eabi

  make all-gcc all-target-libgcc
}

package() {
  cd ${srcdir}/gcc-$pkgver/build
  
  make DESTDIR=$pkgdir install-gcc install-target-libgcc

  rm -f $pkgdir/usr/share/man/man7/fsf-funding.7*
  rm -f $pkgdir/usr/share/man/man7/gfdl.7*
  rm -f $pkgdir/usr/share/man/man7/gpl.7*
  rm -rf $pkgdir/usr/share/info

  cp -r $pkgdir/usr/libexec/* $pkgdir/usr/lib/
  rm -rf $pkgdir/usr/libexec

  # strip it manually
  strip $pkgdir/usr/bin/* 2>/dev/null || true
  find $pkgdir/usr/lib -type f -exec arm-none-eabi-strip {} \; 2>/dev/null || true
}
