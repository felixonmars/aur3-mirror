# Contributor: apollokk <karanti@ontelecoms.gr>

pkgname=newtheme-plasmatheme
pkgver=2
pkgrel=1
pkgdesc="The new, second plasma theme"
arch=('i686' 'x86_64')
license=('GPL')
url="http://wwww.kde-look.org/content/show.php/new-theme+%232?content=100725"
depends=('kdelibs' 'kdebase-workspace')
source=(http://wwww.kde-look.org/CONTENT/content-files/100725-new-theme2.tar.gz)
md5sums=('952f9702663e5f26c68db49c1effb16f')

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R new-theme2 $startdir/pkg/usr/share/apps/desktoptheme
}