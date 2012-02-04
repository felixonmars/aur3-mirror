# Maintainer: jauthu <jauthu@gmail.com>

pkgname=vacuum-spellchecker
pkgver=0.0.3
pkgrel=2
pkgdesc="Plugin adding spell-checker to vacuum"
arch=('i686' 'x86_64')
url="http://http://code.google.com/p/vacuum-plugins/"
license=('GPL')
depends=('vacuum' 'enchant')
makedepends=('cmake' 'qt')
replaces=('vacuum-spell')
source=("http://vacuum-plugins.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('3fa1fe1927cd5d68e887af3a8e4c546e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

