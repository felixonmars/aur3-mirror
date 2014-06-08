pkgname=2gis-tula
pkgver=43
pkgrel=1
pkgdesc="Map of Tula for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tula/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Tula-43.orig.zip")
md5sums=('40b3bbc74b6d43ec5429d6a022090e99')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/2gis-tula.dgdat" || return 1
  
}
