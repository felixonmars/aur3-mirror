# Maintainer: Antonio Rojas

pkgname=fflas-ffpack
pkgver=1.6.0
pkgrel=1
pkgdesc="A library for dense linear algebra over word-size finite fields"
arch=('i686' 'x86_64')
url="http://linalg.org/projects/fflas-ffpack"
license=('LGPL')
depends=('givaro')
source=("http://linalg.org/$pkgname-$pkgver.tar.gz")
md5sums=('726f40bcdbde725469c9f2e4ebbe1d05')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

