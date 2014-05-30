#Contributor Pafrape <pafrape@free.fr>

pkgname=plasma-theme-invisible
_themename=Invisible
pkgver=0.7
pkgrel=1
pkgdesc="Invisible plasmatheme for KDE 4"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'kdebase-workspace')
url="http://kde-look.org/content/show.php/Invisible?content=164089"
depends=('kdelibs' 'kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/164089-$_themename.tar.gz)
md5sums='bf1b96afb7e10b7a7b20810559b906e2'

package() {

  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  cd $srcdir
  cp -r $_themename $pkgdir/usr/share/apps/desktoptheme
  chmod -R 755 $pkgdir/usr/share/apps/desktoptheme/$_themename

}
