pkgname=2gis-cheboksary
pkgver=30
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-30.orig.zip")
md5sums=('8462b184bda765adf7a8d6d3a350a4d5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/2gis-cheboksary.dgdat" || return 1
  
}
