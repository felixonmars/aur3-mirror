# Maintainer: ...
pkgname=cream
pkgver=0.43
pkgrel=1
pkgdesc="A modern configuration of the Vim text editor"
arch=('any')
url="http://cream.sourceforge.net"
license=('GPLV3')
groups=()
depends=(gvim)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
# changelog=http://cream.cvs.sourceforge.net/cream/cream/docs/CHANGELOG.txt
source=(
  http://downloads.sourceforge.net/cream/Cream/$pkgver/cream-$pkgver.tar.gz
)
sha256sums=('b7adee33d5464f985a71722fdbe133e726bffebf34eae14c33674c4c5327d777')
noextract=()

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"

  # export VIMRUNTIME="$pkgdir/usr/share/vim"
  DESTDIR="$pkgdir" sh INSTALL.sh /usr
}

# vim:set ts=2 sw=2 et:
