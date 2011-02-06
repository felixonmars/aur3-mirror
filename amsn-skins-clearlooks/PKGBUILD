# Contributor: Marcelo Cavalcante - kalib <kalibslack at gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>

pkgname=amsn-skins-clearlooks
_pkgname=Clearlooks
pkgver=0.95
pkgrel=3
pkgdesc="amsn skin"
arch=('i686' 'x86_64')
depends=('amsn')
groups=('amsn-skins')
license=('GPL2')
url="http://amsn.sourceforge.net"
source=(http://dl.sourceforge.net/amsn/$_pkgname-$pkgver.zip)
md5sums=('3bc3311cd39d4ce1680136cdd0d5bda0')

build() {
  cd $startdir/src/

  mkdir -p $startdir/pkg/usr/share/amsn/skins
  cp -R $_pkgname $startdir/pkg/usr/share/amsn/skins

  # Some files are not world readable, so let's fix them
  chmod -R a+r $startdir/pkg/usr/share/amsn/skins/*
}
