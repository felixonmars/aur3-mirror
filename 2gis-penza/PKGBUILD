pkgname=2gis-penza
pkgver=43
pkgrel=1
pkgdesc="Map of Penza for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/penza/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Penza-43.orig.zip")
md5sums=('f2aa207525374ba6052d7bee5882151f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/2gis-penza.dgdat" || return 1
  
}
