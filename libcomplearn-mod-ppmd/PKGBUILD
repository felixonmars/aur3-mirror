# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=libcomplearn-mod-ppmd
pkgver=1.0.7
pkgrel=1
epoch=
pkgdesc="PPMD compression module for CompLearn pattern recognition system."
arch=('i686' 'x86_64')
url="http://www.complearn.org/"
license=('BSD')
groups=('complearn')
depends=('libcomplearn')
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
source=(http://www.complearn.org/downloads/$pkgname-$pkgver.tar.gz)
noextract=()

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
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('4719ad67a1c443a1f8ce3a83717c16fe')
