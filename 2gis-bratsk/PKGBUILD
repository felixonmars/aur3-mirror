pkgname=2gis-bratsk
pkgver=36
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/bratsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Bratsk-36.orig.zip")
md5sums=('589c5a61b2f9f86927253d34562d4d43')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/2gis-bratsk.dgdat" || return 1
  
}
