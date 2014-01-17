pkgname=2gis-cheboksary
pkgver=27
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-27.orig.zip")
md5sums=('b3fb24cf6f5b01ea5364fd68f14ddfd3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/cheboksary.dgdat" || return 1
  
}
