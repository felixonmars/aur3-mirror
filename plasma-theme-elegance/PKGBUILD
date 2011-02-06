# Maintainer: Erik Johnson <palehose at gmail dot com>
# Contributor: Max Nemeth <max.nemeth@gmail.com>
pkgname=plasma-theme-elegance
pkgver=0.7
pkgrel=3
pkgdesc="An elegant theme for plasma"
arch=('any')
url="http://kde-look.org/content/show.php/Elegance?content=78034"
license=('LGPL')
depends=('kdebase-workspace')
source=(http://www.kde-look.org/CONTENT/content-files/78034-Elegance.tar.gz)
md5sums=('3b039ba8a8f28f2d7d093b074c514f29')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/apps/desktoptheme
  cp -r Elegance ${pkgdir}/usr/share/apps/desktoptheme/
}

