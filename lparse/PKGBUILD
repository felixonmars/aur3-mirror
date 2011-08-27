# Maintainer: David Serrano <david.nonamedguy@gmail.com>
pkgname=lparse
pkgver=1.1.2
pkgrel=1
pkgdesc="Front-end for smodels"
arch=('i686' 'x86_64')
url="http://www.tcs.hut.fi/Software/smodels/"
license=('GPL')
groups=()
depends=('smodels')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.tcs.hut.fi/Software/smodels/src/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ffaab8bf3a5589ae81c91101a6470657')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin

  make INSTALLATION_PATH="$pkgdir/usr/bin" install
}

# vim:set ts=2 sw=2 et:
