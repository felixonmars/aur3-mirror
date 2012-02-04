# Maintainer: Colin Fowler <elethiomel@gmail.com>
pkgname=rudeconfig
pkgver=5.0.5
pkgrel=1
pkgdesc="A C++ Config File library used for reading and writing configuration / .ini files"
arch=('i686' 'x86_64')
url="http://rudeserver.com/config/index.html"
license=('GPL')
source=("http://rudeserver.com/config/download/rudeconfig-5.0.5.tar.bz2")
md5sums=('0f523ff2366960c57feb29559c8ea7af')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
