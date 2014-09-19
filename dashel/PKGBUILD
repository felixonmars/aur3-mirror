# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=dashel
pkgver=1.0.8.2
pkgrel=1
pkgdesc="Cross-platform DAta Stream Helper Encapsulation Library"
arch=('x86_64' 'i686')
url="http://home.gna.org/dashel/"
license=('BSD')
options=('staticlibs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aseba-community/$pkgname/archive/$pkgver.tar.gz")
md5sums=('5782c7e8c3ba3d945cc06510e78b7768')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m644 debian/copyright -D $pkgdir/usr/share/licenses/$pkgname/copyright
}
