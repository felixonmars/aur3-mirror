# Contributer: Max Nemeth <max.nemeth@gmail.com>
pkgname=moodin-theme-spline
pkgver=1.2
pkgrel=2
pkgdesc="KDE splash screen for Moodin Engine"
arch=('i686')
url="http://kde-look.org/content/show.php?content=57261"
license=('GPL')
depends=('ksplash-engine-moodin')
source=(http://art4linux.org/system/files/spline.tar.gz)
md5sums=('50c7ba94882a38b1f120ef2b5312ba53')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
  cp -r spline $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
} 
