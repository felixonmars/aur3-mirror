# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=nios2-gdb
pkgver=7.0
pkgrel=2
pkgdesc="GNU Gdb for Altera Nios 2 processor"
url="http://www.mutekh.org/www/tools/"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}a.tar.bz2
	http://www.mutekh.org/www/tools/patchs/gdb-$pkgver-nios2-1.diff.gz)
md5sums=('a2d9b5ad4abffd6213627c3899e5a23d'
	 'b331b97e5676ea0d8ef4fecc613b846d')

build() {
  cd "$srcdir"
  ( cd gdb-$pkgver ; patch -p1 < ../gdb-$pkgver-nios2-1.diff ) || return 1
  mkdir -p build && cd build

  ../gdb-$pkgver/configure --prefix=/usr --target=nios2-unknown-elf --disable-nls --disable-werror || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install

  # avoid file collisions
  rm $pkgdir/usr/share/info -rf
  rm $pkgdir/usr/lib -rf
  rm $pkgdir/usr/share/gdb -rf
}

