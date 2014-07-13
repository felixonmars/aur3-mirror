pkgname=2gis-bryansk
pkgver=29
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/bryansk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Bryansk-29.orig.zip")
md5sums=('5a1c18ec9ba6da6c055e63ee322edff8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/2gis-bryansk.dgdat" || return 1
  
}
