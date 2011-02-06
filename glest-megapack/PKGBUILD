# Contributor: revel <revelΘmuub·net>

pkgname=glest-megapack
_pkgname=megapack_v4
pkgver=4.0
pkgrel=1
pkgdesc="Mod for glest - separate megapack techtree with additional factions (Indian, Norsemen, Persian), tilesets, scenarios and maps"
arch=('any')
url="http://www.titusgames.de/"
depends=('glest>=3.2.1')
makedepends=('p7zip')
conflicts=('glest-indian' 'glest-tileset-autumn' 'glest-tileset-desert' 'glest-tileset-evergreen')
replaces=('glest-indian')
license="GPL2"
source=(http://www.titusgames.de/$_pkgname.7z)

md5sums=('946057d45ff2dcbd60117dbdd008d307')

build() {
  # unpack 7z
  cd $srcdir
  7z x $_pkgname.7z || return 1
  
  # fix perms
#  chmod -R a-wxs,u+wX,go+X $_pkgname
  
  mkdir -p $pkgdir/opt/glest
  
  # install
  cd $pkgdir
  mv $srcdir/$_pkgname/glest opt || return 1
  
  cd $srcdir/$_pkgname
  install -d -m 755 $pkgdir/usr/share/doc/glest-megapack
  install -m 644 -t $pkgdir/usr/share/doc/glest-megapack AUTHORS README.txt
  install -d -m 755 $pkgdir/usr/share/licenses/glest-megapack
  install -m 644 -t $pkgdir/usr/share/licenses/glest-megapack COPYING
}

