# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=complexity
pkgver=1.1
pkgrel=1
pkgdesc="Compute a complexity measure for C code"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/complexity/"
license=('GPL')
groups=()
depends=('autogen')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://ftp.gnu.org/gnu/complexity/$pkgname-$pkgver.tar.xz)
noextract=()
sha256sums=('d9e26f705b72e8b6037772ae996de7518034ec89796f0ad9ebc68b27f5304877')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
