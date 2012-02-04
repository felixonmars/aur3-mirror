# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=plasma-theme-opensuse
pkgver=0.2
pkgrel=1
pkgdesc="A Plasma theme branded for openSUSE."
arch=('i686')
url="http://www.kde-look.org/content/show.php/openSUSE?content=91434"
license=('GPL')
depends=('kdebase')
source=(http://80.86.67.101/stuff/openSUSE.tar.gz)
md5sums=('e203dccdba62910fa8a18c6f71a7ca8e')

build() {

mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
cd $startdir/src
cp -r openSUSE $startdir/pkg/usr/share/apps/desktoptheme/

}
