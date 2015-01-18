# Maintainer: vmalloc support@cyborg-connect.de
pkgname=tinycc
pkgver=0.9.26
pkgrel=00
pkgdesc="The Tiny C Compiler is a very small C compiler"
arch=('i686' 'x86_64')
url="http://bellard.org/tcc/"
license=('GPL')
depends=()
makedepends=()
source=("http://download-mirror.savannah.gnu.org/releases/tinycc/tcc-$pkgver.tar.bz2")

sha512sums=('abdbe208498cf4865a2036b5426616f5888b9b0e8d5d2fda6d1dd4afab3386167f12eca87d8a5c4c9b7dc88620d983ddce3e874b7dfa9c21eceea29ffa635d53')


build() {
  cd "$srcdir/tcc-$pkgver"
  ./configure || return 1
  make || return 1
}

package() {
	cd "$srcdir/tcc-$pkgver"
	install -m 755 -D tcc "$pkgdir/usr/bin/tcc"
}
