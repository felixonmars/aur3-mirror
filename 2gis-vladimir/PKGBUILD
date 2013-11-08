pkgname=2gis-vladimir
pkgver=21
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-21.orig.zip")
md5sums=('3b22e9e6de949156e0934d88aae18b74')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/vladimir.dgdat" || return 1
  
}
