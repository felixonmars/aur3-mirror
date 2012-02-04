# Maintainer: David Serrano <david.nonamedguy@gmail.com>
pkgname=smodels
pkgver=2.34
pkgrel=1
pkgdesc="Implementation of the stable model semantics for logic programs"
arch=('i686' 'x86_64')
url="http://www.tcs.hut.fi/Software/smodels/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=('lparse: front-end for smodels')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.tcs.hut.fi/Software/smodels/src/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('825e8da6a2e0f8e922e2485460d84154')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  make LIBPATH=/usr/lib DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
