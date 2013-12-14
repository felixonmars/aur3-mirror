pkgname=2gis-vladivostok
pkgver=45
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-45.orig.zip")
md5sums=('ce3d7530e11590505a7ca9df3c87811b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  
}
