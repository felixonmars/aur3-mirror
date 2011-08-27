# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=monochrome-tray-icons
pkgver=0.5.1
pkgrel=1
pkgdesc="Monochrome tray icons for KDE4 of some applications that used KDE tray protocol"
url="http://kde-look.org/content/show.php/?content=135874"
license=('GPL')
arch=('any')
depends=( 'kdebase-runtime') 
source=(http://kde-look.org/CONTENT/content-files/135874-monochrome.zip)
md5sums=('a2216aad8360f49fcd75ded636afebc0')

build() {

  cd ${srcdir}
  install -dv ${pkgdir}/usr/share/apps/desktoptheme/default/icons/
  echo "install icons..."
  install --mode=644 *.svg --target-directory=${pkgdir}/usr/share/apps/desktoptheme/default/icons/

}
