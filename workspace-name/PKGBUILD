# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
pkgname=workspace-name
pkgver=20070418
_origver=2007-04-18
pkgrel=0
pkgdesc="Shows workspace name when switching desktops"
url="http://www.bwalle.de/drupal/workspace-name"
license="GPL"
depends=(xosd)
arch=(i686 x86_64)
source=(http://www.bwalle.de/programme//workspace-name/$pkgname-$_origver.tar.bz2)
md5sums=('7d6059e07619d211237260a51ba218df')

build() {
  cd $startdir/src/$pkgname-$_origver
  make
  mkdir -p $startdir/pkg/usr/bin
  install -m 0755 workspace-name $startdir/pkg/usr/bin
}
