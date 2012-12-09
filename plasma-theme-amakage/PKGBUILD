# Maintainer: Cippaciong <lacapannadelloziotom [at] gmail [dot] com>

pkgname=plasma-theme-amakage
pkgver=1.3.2
pkgrel=1
pkgdesc="Translucent theme for KDE 4. This will be the successor of Xenon"
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php/Amakage?content=150285"
depends=('kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/150285-Amakage.tar.xz)
md5sums='5bd5d4be9c68d00e3d092eb5d4b37ff9'

package()
{
  mkdir -p ${pkgdir}/usr/share/apps/desktoptheme
  cd ${srcdir}
  cp -R Amakage ${pkgdir}/usr/share/apps/desktoptheme
  chmod 755 -R ${pkgdir}/usr/share/apps/desktoptheme/Amakage
} 
