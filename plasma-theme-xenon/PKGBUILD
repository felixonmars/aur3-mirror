# Maintainer: Adrian Berriel <berriel [at]  gmail [dot] com>

pkgname=plasma-theme-xenon
pkgver=2.0.4
pkgrel=1
pkgdesc="Plasma theme for dark colors"
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php/Xenon?content=125422"
depends=('kdebase-workspace')
source=('https://www.sugarsync.com/pf/D6477137_642_15112622' # Xenon
        'https://www.sugarsync.com/pf/D6477137_642_17855644' # Xenon-black
        'https://www.sugarsync.com/pf/D6477137_642_17855916' # Xenon-white
       )

md5sums=('ecdacd6221d5ac6ed7ba220f9ce36aa1' # Xenon
         '675f3d9075a6d345ce5c0a7c70a4ad6b' # Xenon-black
         'd8ec74ac90b5950d985ed50c5c8b63dd' # Xenon-white
        )

package() {

  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  cd $srcdir
  cp -r Xenon $pkgdir/usr/share/apps/desktoptheme
  chmod -R 755 $pkgdir/usr/share/apps/desktoptheme/Xenon
  
  cd $srcdir
  cp -r Xenon-black $pkgdir/usr/share/apps/desktoptheme
  chmod -R 755 $pkgdir/usr/share/apps/desktoptheme/Xenon-black
  
  cd $srcdir
  cp -r Xenon-white $pkgdir/usr/share/apps/desktoptheme
  chmod -R 755 $pkgdir/usr/share/apps/desktoptheme/Xenon-white

}
