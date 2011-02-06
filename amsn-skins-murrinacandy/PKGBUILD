pkgname=amsn-skins-murrinacandy
_pkgname=MurrinaCandy
pkgver=1.0
pkgrel=1
pkgdesc="amsn skin"
arch=('i686 x86_64')
depends=('amsn')
groups=('amsn-skins')
license=('GPL2')
url="http://amsn.sourceforge.net"
source=(http://mesh.dl.sourceforge.net/sourceforge/amsn/$_pkgname-$pkgver.zip)
md5sums=('deeb146c2f1533412c180f4c20c61467')

build() {
  cd $startdir/src/

  mkdir -p $startdir/pkg/usr/share/amsn/skins
  cp -R Murrina-candy $startdir/pkg/usr/share/amsn/skins

  # Some files are not world readable, so let's fix them
  chmod -R a+r $startdir/pkg/usr/share/amsn/skins/*
}
