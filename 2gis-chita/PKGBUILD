pkgname=2gis-chita
pkgver=31
pkgrel=1
pkgdesc="Map of Chita for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chita/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Chita-31.orig.zip")
md5sums=('5d2616a8bdade2e01ebeacc48b51cbe8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chita.dgdat" "${pkgdir}/opt/2gis/2gis-chita.dgdat" || return 1
  
}
