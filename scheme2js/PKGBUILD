# Maintainer: spider-mario <spidermario@free.fr>
# Contributor:  <david@pako.st>
pkgname=scheme2js
pkgver=20110717
pkgrel=1
pkgdesc="A Scheme to JavaScript compiler, as seen in INRIA’s Hop"
url="http://www-sop.inria.fr/mimosa/$pkgname"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bigloo>=3.0b')
source=("http://www-sop.inria.fr/mimosa/$pkgname/files/$pkgname-$pkgver.tar.gz")
md5sums=('62b7c511148880acfdb9ae81a8f4069c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
