# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=nios2-binutils
pkgver=2.20.1
pkgrel=4
pkgdesc="GNU binutils for Altera Nios 2 processor"
url="http://www.mutekh.org/www/tools/"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2
	http://www.mutekh.org/www/tools/patchs/binutils-$pkgver-nios2-2.diff.gz)
md5sums=('2b9dc8f2b7dbd5ec5992c6e29de0b764'
	 'cb014daff79f17c2e9e4e782a97583dd')

build() {
  cd "$srcdir"
  ( cd binutils-$pkgver ; patch -p1 < ../binutils-$pkgver-nios2-2.diff ) || return 1
  mkdir -p build && cd build

  ../binutils-$pkgver/configure --prefix=/usr --target=nios2-unknown-elf --disable-nls --disable-werror || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install

  # avoid file collisions
  rm $pkgdir/usr/share/info -rf
  rm $pkgdir/usr/lib -rf
}

