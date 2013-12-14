pkgname=2gis-vladimir
pkgver=22
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-22.orig.zip")
md5sums=('028651d2f7d74db0de790aa0cdc0d645')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/vladimir.dgdat" || return 1
  
}
