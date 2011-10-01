# Maintainer: Adrian Berriel <berriel@gmail.com>

pkgname=ksplash-dream
pkgver=2.0
pkgrel=2
pkgdesc="Ksplash for KDM Dreams and the Dreams wallpaper"
arch=('any')
url="http://kde-look.org/content/show.php/Dreams-Ksplash?content=134205"
license=('GPL')
depends=('kdebase-workspace')
source=("http://liquiddezign.com/look/uploads/files/Dreams-Ksplash2.tar.gz")
md5sums=('2c32af9a5f6e15de6607646110a168f5')

build() {
  mkdir -p $startdir/pkg/usr/share/apps/ksplash/Themes
  cd $startdir/src
  cp -R Dreams-Ksplash2 $startdir/pkg/usr/share/apps/ksplash/Themes
}
