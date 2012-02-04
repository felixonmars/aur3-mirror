# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Michal Marek <reqamst at gmail dot com>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# AUR Contributor: dejari

pkgname=editobj
pkgver=0.5.7
pkgrel=4
pkgdesc="EditObj can create a dialog box to edit any Python object"
url="http://home.gna.org/oomadness/en/editobj"
license="GPL"
arch=('any')
options=('!strip')
depends=('python2')
source=(http://download.gna.org/songwrite/EditObj-$pkgver.tar.gz)
md5sums=('d262f0b4769723b0c7d14314c4a58a1f')

build() {
  cd $startdir/src/EditObj-$pkgver
  python2 setup.py install --root=$startdir/pkg
}
