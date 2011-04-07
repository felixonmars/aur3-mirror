# Maintainer: jauthu <jauthu@gmail.com>

pkgname=vacuum-spell
pkgver=0.0.1
pkgrel=3
pkgdesc="Plugin adding spell-checker to vacuum"
arch=('x86' 'x86_64')
url="http://http://code.google.com/p/vacuum-plugins/"
license=('GPL')
depends=('vacuum' 'aspell')
makedepends=('cmake' 'qt')
source=("http://vacuum-plugins.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('6a16e183cbbe6e17f60e41ae0a1ac266')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
