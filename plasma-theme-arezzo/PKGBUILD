#Contributor Tobias-Adrian Stibenz <info@lavalab.org>

pkgname=plasma-theme-arezzo
pkgver=0.6
pkgrel=1
pkgdesc="Arezzo plasmatheme for KDE 4.1"
arch=('i686' 'x86_64')
license=('Creative Commons')
url="http://kde-look.org/content/show.php/Arezzo?content=84403"
depends=('kdelibs' 'kdebase-workspace')
install='hint.install'
source=(http://kde-look.org/CONTENT/content-files/84403-Arezzo.tar.gz)
md5sums='e04d04a6c65f8c86503df74978eaaac6'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Arezzo $startdir/pkg/usr/share/apps/desktoptheme
}