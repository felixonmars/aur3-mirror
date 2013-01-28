# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=maptiler
pkgver=1.0.beta2
pkgrel=1
epoch=0
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('i686' 'x86_64')
url="http://www.maptiler.org/"
license=('BSD')
groups=()
depends=('gdal')
makedepends=('dpkg')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://maptiler.googlecode.com/files/${pkgname}_${pkgver}_all.deb")
noextract=()
md5sums=('4014de76f4a203512b6d8830fbdb6131')

package() {
  dpkg -x ${pkgname}_${pkgver}_all.deb "$pkgdir"
  grep -rl '^#!/usr/bin/env python$' $pkgdir | xargs sed -i 's/^\#\!\/usr\/bin\/env\ python$/\#\!\/usr\/bin\/env\ python2/g'
}

# vim:set ts=2 sw=2 et:
