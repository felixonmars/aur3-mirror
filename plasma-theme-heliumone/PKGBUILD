# Maintainer: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-heliumone
pkgver=1.1.0
pkgrel=1
pkgdesc="Transparent theme based on air and eleonora. but giving it an extra touch"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Helium?content=125471"
depends=('kdebase-workspace')
replaces=('plasma-theme-gremix' 'plasma-theme-helium')
conflicts=('plasma-theme-gremix' 'plasma-theme-helium')
source=(http://dl.dropbox.com/u/4498369/temas%20plasma/Helium%20One/Helium%20One.tar.xz)
md5sums='6b4d5255e45e5e21565a2d2c3ea4ecec'

package() {

  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  cd $srcdir
  cp -r Helium\ One $pkgdir/usr/share/apps/desktoptheme
  chmod -R 755 $pkgdir/usr/share/apps/desktoptheme/Helium\ One

}
