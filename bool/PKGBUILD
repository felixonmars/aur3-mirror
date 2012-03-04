# Maintainer: Jáchym Barvínke <jachymb@gmail.com>
pkgname=bool
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="GNU Bool is a utility for finding files that match a boolean expression"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/bool/"
license=('GPL')
groups=()
depends=()
makedepends=('gcc' 'awk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://ftpmirror.gnu.org/bool/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('5e6eb8893121524b6a1146034ff1f9aa')

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
