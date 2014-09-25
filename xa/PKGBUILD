# Maintainer: Chris Mosher <cmosher01@gmail.com>
pkgname=xa
pkgver=2.3.6
pkgrel=1
epoch=
pkgdesc="Cross-assembler for 6502 microprocessor"
arch=('i686' 'x86_64')
url="http://www.floodgap.com/retrotech/xa/"
license=('GPL2')
groups=()
depends=('glibc')
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
source=(http://www.floodgap.com/retrotech/xa/dists/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('6e7ee302fc4cd8de3bf7f07abb336aca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
