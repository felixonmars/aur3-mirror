# Maintainer: Chuan Ji <jichuan89@gmail.com>
pkgname=pilrc
pkgver=3.2
pkgrel=3
epoch=
pkgdesc='Resource compiler for Palm OS'
arch=('i686' 'x86_64')
url='http://pilrc.sourceforge.net/'
license=('GPL')
depends=()
makedepends=('')
source=("http://downloads.sourceforge.net/project/pilrc/pilrc/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('9a1e114c5fe1f6fa0ffbb742c4d8510e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS=-m32 unix/configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
