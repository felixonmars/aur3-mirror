# Maintainer: Louis R. Marascio <lrm@fitnr.com>

pkgname=littler
pkgver=0.2.1
pkgrel=1
pkgdesc="A hash-bang and simple command line pipe front end for GNU R"
arch=('i686' 'x86_64')
url="http://dirk.eddelbuettel.com/code/littler.html"
license=('GPL')
depends=('r' 'sh')
makedepends=('make' 'gcc' 'r')
source=(http://dirk.eddelbuettel.com/code/littler/$pkgname-$pkgver.tar.gz)
md5sums=('c5e5911c3613c88c3caf439f79195d95')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make -j1 || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
