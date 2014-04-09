pkgname=2gis-vladimir
pkgver=26
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-26.orig.zip")
md5sums=('adafda7e074f08aaccefd94456d3a13a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/2gis-vladimir.dgdat" || return 1
  
}
