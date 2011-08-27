# Maintainer: Yoel Lion <yoel3ster at gmail dot com>

pkgname=hspell-latest
libname=hspell
pkgver=1.1
pkgrel=2
pkgdesc="Hebrew spell-checker"
arch=('i686' 'x86_64')
url="http://hspell.ivrix.org.il/"
license=('GPL')
depends=('glibc' 'perl' 'zlib')
conflicts=('hspell')
source=(http://$libname.ivrix.org.il/$libname-$pkgver.tar.gz)
md5sums=('e79e75180ce529c008ea085954a52f2c')
build() {
  cd $srcdir/$libname-$pkgver
  sed -i '1c#!/usr/bin/gawk -f' wzip
  ./configure --prefix=/usr
  make

  make DESTDIR=$pkgdir install
}
