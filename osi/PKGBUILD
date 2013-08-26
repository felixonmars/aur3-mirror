# Contributor: Robert Schwarz <mail at rschwarz dot net>

pkgname=osi
_ucpkgname=Osi
pkgver=0.106.1
pkgrel=1
pkgdesc="COIN-OR Open Solver Interface"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Osi/"
license=('CPL')
depends=('coin-utils')
makedepends=()
source=(http://www.coin-or.org/download/source/Osi/$_ucpkgname-$pkgver.tgz)
md5sums=('e673f614a75a0f1cb4faab9de481790e')

build() {
  cd "$srcdir/$_ucpkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_ucpkgname-$pkgver"
  
  make test
}

package() {
  cd "$srcdir/$_ucpkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
