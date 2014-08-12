pkgname=2gis-tula
pkgver=45
pkgrel=1
pkgdesc="Map of Tula for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tula/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Tula-45.orig.zip")
md5sums=('ef45f915cffa8f819721f66452e215f7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/2gis-tula.dgdat" || return 1
  
}
