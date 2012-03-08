# Maintainer: s1gma <s1gma@mindslicer.com>

pkgname=cifer
pkgver=1.2.0
pkgrel=2
pkgdesc="A multipurpose classical cryptanalysis and code breaking tool"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cifer/"
license=('GPL3')
depends=('readline')
makedepends=()
optdepends=()
provides=('cifer')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://cifer.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('6fba4f27b09722ea07524e940c1e923f')
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -B CFLAGS=-O2 all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
