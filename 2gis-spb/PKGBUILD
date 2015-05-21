pkgname=2gis-spb
pkgver=51
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, May 2015"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sankt-peterburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Spb-51.orig.zip")
md5sums=('757557fd27b93df2091d62d99985017e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/2gis-spb.dgdat" || return 1
  
}
