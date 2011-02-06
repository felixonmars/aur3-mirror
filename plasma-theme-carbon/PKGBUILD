# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=plasma-theme-carbon
pkgver=1.4.1
pkgrel=1
pkgdesc="A plasma theme inspired by carbon bodywork."
arch=('i686' 'x86_64')
url="http://www.kde-look.org:80/content/show.php?content=107252"
license=('GPL')
depends=('kdebase-workspace')
source=(http://www.kde-look.org:80/CONTENT/content-files/107252-Carbon.tar.gz)
md5sums=('f0dd1311c188be205cc7fb86fd047d1e')

build() {

mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
cd $startdir/src
cp -r Carbon $startdir/pkg/usr/share/apps/desktoptheme/

}
