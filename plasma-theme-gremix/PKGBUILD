# Maintainer: Adrian Berriel <berriel@gmail.com>

pkgname=plasma-theme-gremix
pkgver=7.3.2
pkgrel=1
pkgdesc="Transparent theme based on air and eleonora. but giving it an extra touch"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/G-remix?content=125471"
depends=('kdebase-workspace' 'kdelibs')
source=(http://dl.dropbox.com/u/4498369/temas%20plasma/G-remix/G-remix.tar.gz)
md5sums='9de6cfc9fe14b9c5837f8021b645edfe'

build() {
    return 0
}

package() {

  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  cd $srcdir
  cp -r G-Remix $pkgdir/usr/share/apps/desktoptheme
  chmod -R 755 $pkgdir/usr/share/apps/desktoptheme/G-Remix

}
