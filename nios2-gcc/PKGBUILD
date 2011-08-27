# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=nios2-gcc
pkgver=4.4.4
pkgrel=3
pkgdesc="GNU C compiler for Altera Nios 2 processor"
url="http://www.mutekh.org/www/tools/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('nios2-binutils')
makedepends=('bison')
options=('!strip')

source=(http://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.bz2
	http://www.mutekh.org/www/tools/patchs/gcc-$pkgver-nios2-2.diff.gz)

md5sums=('7ff5ce9e5f0b088ab48720bbd7203530'
	 '191ead65de694c6b0ae40d9f41e7f469')

build() {
  cd ${srcdir}

  ( cd gcc-$pkgver ; patch -p0 < ../gcc-$pkgver-nios2-2.diff ) || return 1
  mkdir -p build && cd build

  unset CFLAGS
  unset CXXFLAGS
  ../gcc-$pkgver/configure --target=nios2-unknown-elf --disable-nls --disable-werror \
  			   --enable-languages=c --disable-libssp --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install

  # avoid file collisions
  rm $pkgdir/usr/info -rf
  rm $pkgdir/usr/lib/libiberty.a -f
}

