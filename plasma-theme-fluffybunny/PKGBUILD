# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=plasma-theme-fluffybunny
pkgver=1.0
pkgrel=2
pkgdesc="Fluffy bunnies all over your plasma."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Plain?content=101944"
license=('GPL')
depends=('kdebase-workspace')
source=(http://berkenpies.nl/fluffy_bunny/fluffy_bunny.tar.bz2)
md5sums=('94e02a9401e4745770f391abe2fb8f78')

build() {

mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
cd $startdir/src
cp -r fluffybunny $startdir/pkg/usr/share/apps/desktoptheme/

}
