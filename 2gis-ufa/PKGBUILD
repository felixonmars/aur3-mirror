pkgname=2gis-ufa
pkgver=75
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ufa/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Ufa-75.orig.zip")
md5sums=('586c10f951d87fc168d53b2defab4d93')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/2gis-ufa.dgdat" || return 1
  
}
