# Maintainer: Sven Schober <sschober (at) sssm (dot) de>
# Contributor: Pierre-Paul Paquin <pierrepaulpaquin@gmail.com>
# Contributor: carloratm
pkgname=pgtap
pkgver=0.94
pkgrel=1
pkgdesc="TAP and/or xUnit-style test framework for PostgreSQL"
arch=(i686 x86_64)
url="http://pgtap.org"
license=(custom)
depends=(postgresql)
makedepends=(postgresql-libs)
optdepends=()
source=(http://api.pgxn.org/dist/$pkgname/$pkgver.0/$pkgname-$pkgver.0.zip LICENSE)
md5sums=('c53144c7cf9fd7d7b37b6a7deb6722ed'
         '9e257a16e08a137c5826f67eb12c8682')

build() {
  cd "$srcdir/$pkgname-$pkgver.0"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.0"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}
