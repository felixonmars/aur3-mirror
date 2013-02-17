# Maintainer: Magnus Olsson <magnus@minimum.se>

_target=cr16-unknown-elf
_sysroot=/usr/lib/${_target}

pkgname=cr16-elf-newlib
pkgver=2.0.0
pkgrel=1
pkgdesc="CR16 newlib"
arch=('x86_64' 'i686')
license=('GPL')
options=('!libtool' '!strip' '!buildflags' '!makeflags')
url="http://sourceware.org/newlib/"
depends=()
makedepends=("cr16-elf-gcc-base" "cr16-elf-binutils")
source=(ftp://sourceware.org/pub/newlib/newlib-${pkgver}.tar.gz)
md5sums=('e3e936235e56d6a28afb2a7f98b1a635')

build() {
  cd $srcdir/newlib-${pkgver}

  mkdir -p build
  cd build

  ../configure  --build=$CHOST --host=$CHOST -target=${_target} \
	--with-build-sysroot=${_sysroot} --prefix=${_sysroot} --disable-multilib \
    --disable-shared    

  make || return 1
}

package() {
  cd $srcdir/newlib-${pkgver}/build

  make DESTDIR=$pkgdir install
}
