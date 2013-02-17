# Maintainer: Magnus Olsson <magnus@minimum.se>

_target=cr16-unknown-elf
_sysroot=/usr/lib/${_target}

pkgname=cr16-elf-gcc
pkgver=4.7.2
pkgrel=1
pkgdesc="CR16 GCC compiler (with libc)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org"
depends=("cr16-elf-binutils" "mpfr" "libmpc" "gmp" "cr16-elf-newlib")
conflicts=("cr16-elf-gcc-base")
options=('!libtool' '!strip' '!buildflags')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('cc308a0891e778cfda7a151ab8a6e762')

build() {
  cd ${srcdir}/gcc-${pkgver}

  mkdir -p build
  cd build

  ../configure --prefix=${_sysroot} --bindir=/usr/bin \
    --with-sysroot=${_sysroot} --build=$CHOST --host=$CHOST \
    --target=${_target} --enable-languages=c --with-newlib \
    --disable-threads --disable-nls --disable-shared \
    --disable-multilib

  make all-gcc all-target-libgcc || return 1  
}

package() {
  cd ${srcdir}/gcc-${pkgver}/build

  make DESTDIR=$pkgdir/ install-gcc install-target-libgcc || return 1

  # clean-up cross compiler root
  rm -r ${pkgdir}/${_sysroot}/share
  
  # manually strip files
  strip ${pkgdir}/usr/bin/*
  strip -S ${pkgdir}/${_sysroot}/libexec/gcc/${_target}/${pkgver}/{cc1,collect2,lto1,lto-wrapper,liblto_plugin.so*}
  ${_target}-strip -S ${pkgdir}/${_sysroot}/lib/gcc/${_target}/${pkgver}/*.{o,a}
}
