# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=mod_tile-svn
pkgver=26332
pkgrel=1
pkgdesc="Mod tile is an apache module to serve raster OpenStreetMap tiles for example to use within a slippy map."
arch=('x86_64')
url="http://wiki.openstreetmap.org/wiki/Mod_tile"
license=('GPL')
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
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://svn.openstreetmap.org/applications/utils/mod_tile/

build() {
  cd "$srcdir"

  svn co $_svntrunk -r $pkgver $pkgname-$pkgver
  cd $pkgname-$pkgver

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir "$pkgdir/etc/"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
