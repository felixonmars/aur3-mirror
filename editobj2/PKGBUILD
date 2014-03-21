# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# AUR Contributor: dejari
# current editor for AUR: Eric Forgeot < http://ifiction.free.fr >

pkgname=editobj2
pkgver=0.3
pkgrel=2
pkgdesc="EditObj can create a dialog box to edit any Python object"
url="http://home.gna.org/oomadness/en/editobj"
license="GPL"
arch=('any')
options=('!strip')
depends=('python2')
provides=('editobj')
conflicts=('editobj')
source=(http://download.gna.org/songwrite/EditObj2-$pkgver.tar.gz)
md5sums=('8df0397b86e63b1ece1da4ffb5143053')

build() {
  cd $startdir/src/EditObj2-$pkgver
  python2 setup.py install --root=$startdir/pkg/editobj2/
}


