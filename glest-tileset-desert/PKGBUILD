# Contributor: revel <revelΘmuub·net>

pkgname=glest-tileset-desert
pkgver=2.0
pkgrel=1
pkgdesc="Tileset for glest"
arch=('any')
url="http://www.titusgames.de/"
depends=('glest')
makedepends=('unzip')
conflicts=()
license="GPL"
source=('http://titusgames.de/desert2.zip')
md5sums=('0e901d63ac72330a5d486d2ec53af5a6')

build() {
  # fix perms
  chmod -R ugo-wxs,u+wX,go+X $srcdir/desert2

  mkdir -p $pkgdir/opt/glest/tilesets
  
  # install
  cd $pkgdir
#  cp -R $srcdir/desert2 opt/glest/tilesets
  mv $srcdir/desert2 opt/glest/tilesets
}
