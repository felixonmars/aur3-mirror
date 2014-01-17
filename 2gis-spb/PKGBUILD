pkgname=2gis-spb
pkgver=35
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Spb-35.orig.zip")
md5sums=('8f1cd883e8a78e54b3dddd4473d84dd0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  
}
