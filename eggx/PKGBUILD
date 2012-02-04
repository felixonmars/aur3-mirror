# Maintainer: Akeru <AkeruLC@gmail.com>

pkgname=eggx
pkgver=0.93r4
pkgrel=1
pkgdesc="An extremely simple X11 graphics library for C and FORTRAN."
arch=('i686' 'x86_64')
url="http://www.ir.isas.jaxa.jp/~cyamauch/eggx_procall"
license=('GPL')
optdepends=('netpbm: to apply file-formats supported by netpbm' 'imagemagick: to apply file-formats supported by imagemagick')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('ad6cf455d3e74595ca91ec7b205ec98a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ln -sf Makefile.linux Makefile
  sed -e "/^PREFIX/c PREFIX = \/usr" Makefile > buf
  mv buf Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
