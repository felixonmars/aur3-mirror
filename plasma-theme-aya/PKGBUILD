#Contributor Tobias-Adrian Stibenz <info@lavalab.org>

pkgname=plasma-theme-aya
pkgver=1.3
pkgrel=1
pkgdesc="Aya plasmatheme for KDE 4.1"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Aya?content=76197"
depends=('kdelibs' 'kdebase-workspace')
install='hint.install'
source=(http://kde-look.org/CONTENT/content-files/76197-Aya.tar.gz)
md5sums='5cc5d94b0cf5f93867144225f7a02285'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cp -R Aya $startdir/pkg/usr/share/apps/desktoptheme
}