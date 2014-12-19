# Maintainer: MS <queueRAM@gmail.com>
pkgname=libbmp
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple library used for manipulating bitmap (BMP) image files"
arch=('i686' 'x86_64')
url="https://code.google.com/p/libbmp/"
license=('GPL')
depends=('glibc')
source=(https://libbmp.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('a0b60eb404888111b310ba7c21b35867')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
