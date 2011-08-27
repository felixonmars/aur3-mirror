#Contributor Adrian Berriel <berriel@gmail.com>

pkgname=plasma-theme-fushigi
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple plasma theme for FushigiProject"
arch=('i686' 'x86_64')
license=('CCPL')
url="http://kde-look.org/content/show.php/Fushigi?content=137517"
depends=('kdelibs' 'kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/137517-Fushigi.tar.gz)
md5sums='91956a50ec599fbc2f4f9a55bfd9daf0'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Fushigi $startdir/pkg/usr/share/apps/desktoptheme
}
