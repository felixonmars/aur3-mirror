#Contributor Tobias-Adrian Stibenz <info@lavalab.org>

pkgname=plasma-theme-glassified
pkgver=4.1.0
pkgrel=1
pkgdesc="Glassified plasmatheme for KDE 4"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Glassified?content=81388"
depends=('kdelibs' 'kdebase-workspace')
install='hint.install'
source=('http://kde-look.org/CONTENT/content-files/81388-Glassified.tar.gz')
md5sums=('64cec8bf2796860ffee638fcca1233de')

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Glassified $startdir/pkg/usr/share/apps/desktoptheme
}