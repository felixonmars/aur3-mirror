# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=kde-thumbnailer-geogebra
pkgver=1.0
pkgrel=1
pkgdesc="KDE thumbnailer for GeoGebra"
arch=('i686' 'x86_64')
url="http://www.geogebra.org/en/wiki/index.php/GeoGebra_in_Linux"
license=('GPL3') 
depends=('kdelibs')
conflicts=('geogebra-thumbnail-kde')
makedepends=('automoc4' 'cmake')
install='kde-thumbnailer-geogebra.install'
source=("https://github.com/downloads/moostik/AUR-packages/GeoGebra_Thumbnail_KDE.tar.gz"
	"desktop.patch")
md5sums=('f4871dda757f80f0d792450d6c7ff2c2'
         '2527f7796798607044562b4d2ac71784')

build() {
  cd "${srcdir}/GeoGebraThumbnail"
  patch -p0 < "${srcdir}/desktop.patch"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
}

package() {
  cd "${srcdir}/GeoGebraThumbnail/build"
  make DESTDIR="${pkgdir}" install
}
