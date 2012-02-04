# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Max Meyer <dev@fedux.org>
pkgname=recutils
pkgver=1.4
pkgrel=2
pkgdesc="GNU tools and libraries to access human-editable, text-based databases."
arch=(i686 x86_64)
url="http://www.gnu.org/software/recutils/"
license=('GPL')
depends=(libgcrypt curl)
makedepends=(make) 
optdepends=(openssl mdbtools)
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
install=recutils.install
#changelog=
source=("http://ftp.gnu.org/gnu/recutils/$pkgname-$pkgver.tar.gz"
       )
sha256sums=('fba69f0e4d57312519b7cff533c7cc229137a5e4f3e6eff0aef8cd36ebaf53cd')
options=(!libtool)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver" 
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
