# Maintainer: Vasco Conde <vasconde@gmail.com>
pkgname=gama
pkgver=1.13
pkgrel=1
epoch=
pkgdesc="GNU Gama is a project dedicated to adjustment of geodetic networks."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gama/"
license=('GPLv3')
groups=()
depends=('expat>=1.1')
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
source=(http://ftpmirror.gnu.org/gama/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('340d6cd103634029caa43740a692939b')

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
