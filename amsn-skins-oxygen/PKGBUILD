# Contributor: Jesper Sandström - inthevidual <jesper@inthevidual.com>

pkgname=amsn-skins-oxygen
_pkgname=Oxygen
pkgver=1.0
pkgrel=1
pkgdesc="aMSN skin resembling the default KDE4 theme"
arch=('i686' 'x86_64')
depends=('amsn')
groups=('amsn-skins')
license=('GPL2')
url="http://amsn.sourceforge.net"
source=(http://linux.inthevidual.com/Oxygen.tar.gz)
md5sums=('1a7a91e905fd809959d464e0c73a9e00')

build() {
  cd $startdir/src/

  mkdir -p $startdir/pkg/usr/share/amsn/skins
  cp -R $_pkgname $startdir/pkg/usr/share/amsn/skins

  # Some files are not world readable, so let's fix them
  chmod -R a+r $startdir/pkg/usr/share/amsn/skins/*
}
