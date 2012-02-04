#Contributor Fedor suchkov <f.suchkov@gmail.com>

pkgname=plasma-theme-oxyglass
pkgver=0.1
pkgrel=1
pkgdesc="Oxyglass plasmatheme for KDE 4.2"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Oxyglass?content=96513"
depends=('kdelibs' 'kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/96513-Oxyglass.tar.gz)
md5sums='de1cf847cc9d2cf26dca5dae33dffb26'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Oxyglass $startdir/pkg/usr/share/apps/desktoptheme
}
