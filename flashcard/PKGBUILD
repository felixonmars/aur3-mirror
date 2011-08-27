# Contributor: Alex Avance <aravance@gmail.com>
pkgname=flashcard
pkgver=1.3
pkgrel=1
pkgdesc="A simple program for making and studying flash cards"
arch=('any')
url="http://aur.archlinux.org/packages/flashcard/flashcard/$pkgname-$pkgver.tar.gz"
license=('GPL')
groups=()
depends=('wxgtk')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=($pkgname-$pkgver.tar.gz::$url)
noextract=()
md5sums=('7fa04dd76ddce08ddb4ebd50e72c141c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

