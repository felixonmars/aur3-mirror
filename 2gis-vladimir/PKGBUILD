pkgname=2gis-vladimir
pkgver=23
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-23.orig.zip")
md5sums=('2f3d2c04459b37aaabf669f887e4cf19')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/vladimir.dgdat" || return 1
  
}
