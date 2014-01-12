# Maintainer: danyf90 <daniele.formichelli@gmail.com>

pkgname=plasma-theme-produkt
_themename=produkt
pkgver=0.2
pkgrel=1
pkgdesc="A textured plasma theme for Plasma-KDE"
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php?content=124213"
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/124213-$_themename.tar.gz")
sha512sums='1881b3dae0c73be757a9461191e249df8f226dd2e19afaa207b1c54909b8f03fb1fe91c2aa2586a6c761e686bc762c89d9de292e56d1d9f06aa1894e237dd4ad'

package() {
  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  mv $_themename $pkgdir/usr/share/apps/desktoptheme
  chmod 755 -R $pkgdir/usr/share/apps/desktoptheme/$_themename
}