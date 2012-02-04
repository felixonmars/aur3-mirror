# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=cinvoke
pkgver=1.0
pkgrel=2
pkgdesc="Library for connecting to C libraries at runtime"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/cinvoke/"
license=('BSD')
makedepends=('perl')
source=(http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('adf9f13908166ce2509aa687b44f06f5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  perl configure.pl --prefix=${pkgdir}/usr

  sed -i 's|install lib|install -m644 lib|' Makefile

  make || return 1
  make install || return 1

  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/cinvoke/LICENSE.txt || return 1
}
