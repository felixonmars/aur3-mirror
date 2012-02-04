# Contributor: revel <revelΘmuub·net>

pkgname=glest-tileset-evergreen
pkgver=1.0
pkgrel=2
pkgdesc="Tileset for glest"
arch=('any')
url="http://www.titusgames.de/"
depends=('glest')
makedepends=('unzip')
conflicts=()
license="GPL"
source=('http://titusgames.de/evergreen.zip')
md5sums=('6675892e5ca27030931d66d26362ba7d')

build() {
  # fix perms
  chmod -R ugo-wxs,u+wX,go+X $srcdir/evergreen

  mkdir -p $pkgdir/opt/glest/tilesets
  
  # install
  cd $pkgdir
#  cp -R $srcdir/evergreen opt/glest/tilesets
  mv $srcdir/evergreen opt/glest/tilesets
}
