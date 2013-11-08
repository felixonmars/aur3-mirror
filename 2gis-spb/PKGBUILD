pkgname=2gis-spb
pkgver=33
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Spb-33.orig.zip")
md5sums=('85f79bd6e40e285711970b3ddfbe1e7b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  
}
