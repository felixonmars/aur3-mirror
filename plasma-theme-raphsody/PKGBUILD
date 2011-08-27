#Contributor Fedor Suchkov <f.suchkov@gmail.com>

pkgname=plasma-theme-raphsody
pkgver=0.3
pkgrel=1
pkgdesc="Raphsody plasmatheme for KDE 4.2"
arch=('i686' 'x86_64')
license=('CCPL')
url="http://www.kde-look.org/content/show.php?content=95741"
depends=('kdelibs' 'kdebase-workspace')
source=(http://www.kde-look.org/CONTENT/content-files/95741-Raphsody.tar.gz)
md5sums=('714f22612b27cc59033835a74f358681')

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Raphsody $startdir/pkg/usr/share/apps/desktoptheme
}
