# Maintainer: Thomas Oster <thomas.oster@rwth-aachen.de>
pkgname=inkscape-extension-visicut
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="An extension to run VisiCut on all selected elements directly from Inkscape"
arch=(any)
url="http://visicut.org"
license=('LGPL')
groups=()
depends=(python2 inkscape python2-lxml visicut)
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
source=(visicut_export.inx visicut_export.py daemonize.py)
noextract=()
md5sums=('91bbdaa10bfa83c3530f0cdcaa3d6069'
         'db9d68d23b12d5c6a298e683b5cd3cba'
         '2a711e173eeab0d913ed5a6e2b87e9fb')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/inkscape/extensions"
  cp visicut_export.inx "$pkgdir/usr/share/inkscape/extensions/"
  cp visicut_export.py "$pkgdir/usr/share/inkscape/extensions/"
  cp daemonize.py "$pkgdir/usr/share/inkscape/extensions/"
}
