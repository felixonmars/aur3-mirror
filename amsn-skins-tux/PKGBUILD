# Contributor: Marcelo Cavalcante - kalib <kalibslack at gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>

pkgname=amsn-skins-tux
_pkgname=Tux
pkgver=0.95
pkgrel=2
pkgdesc="amsn skin"
arch=('i686')
depends=('amsn')
groups=('amsn-skins')
license=('GPL2')
url="http://amsn.sourceforge.net"
source=(http://dl.sourceforge.net/amsn/$_pkgname-$pkgver.zip)
md5sums=('374190326fee8d50e0c15dfab4592bbc')

build() {
  cd $startdir/src/

  mkdir -p $startdir/pkg/usr/share/amsn/skins
  cp -R $_pkgname $startdir/pkg/usr/share/amsn/skins

  # Some files are not world readable, so let's fix them
  chmod -R a+r $startdir/pkg/usr/share/amsn/skins/*
}
