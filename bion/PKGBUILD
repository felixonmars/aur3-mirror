# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=bion
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Bion is a classical biorhythm program which uses both a console based and Web based system to display physical, emotional, and intellectual variations based on the user's date of birth."
arch=(i686)
url="http://freecode.com/projects/bion"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f6a60602c1be7bbf399f0ef99abd91cc')

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
