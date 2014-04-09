pkgname=2gis-samara
pkgver=69
pkgrel=1
pkgdesc="Map of Samara for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Samara-69.orig.zip")
md5sums=('d73cb5c1befe02debaef95e00ec472ba')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Samara.dgdat" "${pkgdir}/opt/2gis/2gis-samara.dgdat" || return 1
  
}
