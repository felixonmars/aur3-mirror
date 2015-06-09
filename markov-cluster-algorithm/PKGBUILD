# Maintainer: Roberto Catini <roberto.catini@gmail.com>
pkgname=markov-cluster-algorithm
pkgver=14_137
pkgrel=1
pkgdesc="A fast and scalable unsupervised cluster algorithm for networks (also called mcl)"
arch=('any')
url="http://www.micans.org/mcl/"
license=('GPL3')
source=(http://www.micans.org/mcl/src/mcl-${pkgver//_/-}.tar.gz)
md5sums=('bc8740456cf51019d0a9ac5eba665bb5')

build() {
  cd "$srcdir/mcl-${pkgver//_/-}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/mcl-${pkgver//_/-}"
  make DESTDIR="$pkgdir/" install
}
