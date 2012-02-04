# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=geogebra-thumbnail-kde
pkgver=1.0
pkgrel=2
pkgdesc="KDE thumbnailer for GeoGebra"
arch=('i686' 'x86_64')
url='http://www.geogebra.org/en/wiki/index.php/GeoGebra_in_Linux'
license=('GPL3') 
depends=('kdelibs' 'geogebra')
makedepends=('automoc4' 'cmake')
install=('geogebra-thumbnail-kde.install')
source=(http://www.geogebra.org/download/GeoGebra_Thumbnail_KDE.tar.gz)

build() {
  cd $srcdir/GeoGebraThumbnail
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make || return 1
}

package() {
  cd $srcdir/GeoGebraThumbnail/build
  make DESTDIR=$pkgdir install
}

md5sums=('f4871dda757f80f0d792450d6c7ff2c2')
