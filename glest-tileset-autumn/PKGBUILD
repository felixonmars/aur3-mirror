# Contributor: revel <revelΘmuub·net>

pkgname=glest-tileset-autumn
pkgver=0.1
pkgrel=1
pkgdesc="Tileset (beta version) for glest"
arch=('any')
url="http://www.titusgames.de/"
depends=('glest')
makedepends=('unzip')
conflicts=()
license="GPL"
source=('http://titusgames.de/autumn_beta.zip')
md5sums=('8f95f99b30044c7c2fdb83ee11bad04d')

build() {
  # fix perms
  chmod -R ugo-wxs,u+wX,go+X $srcdir/autumn_beta

  mkdir -p $pkgdir/opt/glest/tilesets
  
  # install
  cd $pkgdir
#  cp -R $srcdir/autumn_beta opt/glest/tilesets
  mv $srcdir/autumn_beta opt/glest/tilesets
}
