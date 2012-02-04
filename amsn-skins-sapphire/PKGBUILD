pkgname=amsn-skins-sapphire
_name=Sapphire
pkgver=2.5
pkgrel=1
pkgdesc="aMSN Sapphire 2.5 Skin"
url="http://artistic.lnxteam.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('amsn' 'python')
optdepends=('zenity: For plugin Desktop Integration')
makedepends=()
source=(http://downloads.tuxfamily.org/amsnskins/skins/$_name$pkgver.tar.gz)

md5sums=('6429607ed1c5177138ca4ed6fa498100')

build() {
  
  cd $srcdir/$pkgver
  mkdir -p $pkgdir/usr/share/amsn/skins/$_name-$pkgver
  cp -R * $pkgdir/usr/share/amsn/skins/$_name-$pkgver

}


