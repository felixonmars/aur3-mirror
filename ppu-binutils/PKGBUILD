# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=ppu-binutils
pkgver=2.20.1
pkgrel=1
pkgdesc="GNU toolchain for cross-compiling to Cell Broadband Engine's PPU"
arch=('i686' 'x86_64')
url="http://ftp.gnu.org/gnu/binutils/"
license=('GPL')
install=${pkgname}.install
source=(http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
sha256sums=('228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8')

build() {
  cd "${srcdir}/binutils-${pkgver}"
  ./configure --prefix=/usr/lib/cell/toolchain \
    --disable-shared --disable-nls --disable-werror --disable-includedir --disable-infodir \
    --program-prefix=ppu- \
    --build=$(arch) \
    --target=powerpc64-linux-gnu \
    --enable-targets=spu \
    --mandir=/usr/share/man \
    --libdir=/usr/lib/cell/toolchain/powerpc64-linux-gnu/lib \
    --includedir=/usr/lib/cell/toolchain/powerpc64-linux-gnu/include
  make || return 1
  make DESTDIR="${pkgdir}/" install || return 1
}
