# Maintainer: Brandon Invergo <brandon@invergo.net>
# Contributor: Max Meyer <dev@fedux.org>
# Contributor: Sven Wick <sven.wick@gmx.de>

pkgname=recutils
pkgver=1.7
pkgrel=1
pkgdesc="GNU tools and libraries to access human-editable, text-based databases."
arch=(i686 x86_64)
url="http://www.gnu.org/software/recutils/"
license=('GPL3')
depends=(libgcrypt curl)
makedepends=(make)
optdepends=(openssl mdbtools)
#options=()
install=recutils.install
changelog=ChangeLog
source=("http://ftp.gnu.org/gnu/recutils/$pkgname-$pkgver.tar.gz"
        "examples.tar.gz"
)
sha256sums=('233dc6dedb1916b887de293454da7e36a74bed9ebea364f7e97e74920051bc31'
            '39fd0899bd954ed93c190f570073aec64cd481c7fc23ebe890a06ba887aa65ff')
options=(!libtool)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  # examples
  mkdir -p "$pkgdir/usr/share/doc/recutils/"
  mv "$srcdir/examples" "$pkgdir/usr/share/doc/recutils/"
}

# vim:set ts=2 sw=2 et:
