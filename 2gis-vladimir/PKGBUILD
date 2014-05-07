pkgname=2gis-vladimir
pkgver=27
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-27.orig.zip")
md5sums=('3c9b4895429b6ae6f0de5c3d7e9158e2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/2gis-vladimir.dgdat" || return 1
  
}
