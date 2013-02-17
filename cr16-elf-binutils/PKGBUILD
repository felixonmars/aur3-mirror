# Maintainer: Magnus Olsson <magnus@minimum.se>

_target=cr16-unknown-elf
_sysroot=/usr/lib/${_target}
pkgname=cr16-elf-binutils
pkgver=2.23.1
pkgrel=1
pkgdesc="CR16 binutils"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.10.1' 'zlib')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
md5sums=('33adb18c3048d057ac58d07a3f1adb38')

build() {
  cd $srcdir/binutils-$pkgver
  
  mkdir -p build 
  cd build

  ../configure --prefix=${_sysroot} --bindir=/usr/bin \
    --with-sysroot=${_sysroot} --build=$CHOST --host=$CHOST \
    --target=${_target} --enable-shared --disable-static \
    --disable-nls --disable-multilib

  make configure-host || return 1
  make || return 1
  make -j1 DESTDIR=$pkgdir/ install
  
  # clean-up cross compiler root
  rm -r ${pkgdir}/${_sysroot}/share/{info,man}
}
