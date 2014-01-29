# Contributor: apollokk <karanti@ontelecoms.gr>
# Maintainer: Ben R <thebenj88 *AT* gmail *DOT* com>

pkgname=droid-plasmatheme
pkgver=0.1
pkgrel=2
pkgdesc="A new, Google Android like, plasma theme"
arch=('i686' 'x86_64')
license=('GPLv3')
url="http://www.kde-look.org/content/show.php/Droid?content=100338"
depends=('kdelibs' 'kdebase-workspace')
source=(http://www.kde-look.org/CONTENT/content-files/100338-Droid.tar.gz)
sha1sums=('a29ee95793a7799fdd1146da6a259927f4830d8a')

package()
{
  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  cd $srcdir
  cp -R Droid $pkgdir/usr/share/apps/desktoptheme
}