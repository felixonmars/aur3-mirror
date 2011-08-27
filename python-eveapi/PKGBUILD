# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=python-eveapi
pkgver=1.1.1
pkgrel=1
pkgdesc="A python RPC wrapper for the EVE API which can be used to create python scripts for EVE-Online programs."
arch=('i686')
url="http://home.wanadoo.nl/ntt/eve/library/"
license=('GPL')
depends=('python')
options=('!strip')
source=(http://home.wanadoo.nl/ntt/eve/library/files/api/eveapi.py)
md5sums=('d3931c76d701413455658f6fb828026b')

build() {
  mkdir -p $startdir/pkg/usr/lib/python2.6/site-packages
  cp $startdir/src/eveapi.py $startdir/pkg/usr/lib/python2.6/site-packages/
}

# vim:set ts=2 sw=2 et:
