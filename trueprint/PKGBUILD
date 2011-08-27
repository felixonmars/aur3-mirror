# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=trueprint
pkgver=5.3
pkgrel=1
epoch=
pkgdesc="print program listings on postscript printer"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/trueprint/"
license=('GPLv2')
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
source=(http://ftp.gnu.org/gnu/trueprint/$pkgname-$pkgver.tar.gz)
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
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('0615d55e45ca5131001b8e49bc330995')
