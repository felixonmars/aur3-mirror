#Contributor Tobias-Adrian Stibenz <info@lavalab.org>

pkgname=plasma-theme-professional
pkgver=0.1
pkgrel=1
pkgdesc="Professional plasmatheme for KDE 4.1"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Professional?content=84680"
depends=('kdelibs' 'kdebase-workspace')
install='hint.install'
source=(http://kde-look.org/CONTENT/content-files/84680-Professional.tar.gz)
md5sums='04a05d71df66430930cf96a332b7185d'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Professional $startdir/pkg/usr/share/apps/desktoptheme
}