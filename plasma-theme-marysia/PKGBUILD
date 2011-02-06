#Contributor Tobias-Adrian Stibenz <info@lavalab.org>

pkgname=plasma-theme-marysia
pkgver=1.8.3
pkgrel=1
pkgdesc="Marysia plasmatheme for KDE 4.1"
arch=('i686' 'x86_64')
license=('creative commons')
url="http://kde-look.org/content/show.php/Marysia?content=80239"
depends=('kdelibs' 'kdebase-runtime' 'kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/80239-Marysia.tar.gz)
md5sums='2d7907aabdf05849339dcfc769c9009f'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd Marysia
  rm colors~
  cd ..
  cp -R Marysia $startdir/pkg/usr/share/apps/desktoptheme
}