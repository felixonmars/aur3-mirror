pkgname=2gis-krasnodar
pkgver=46
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-46.orig.zip")
md5sums=('109cdc43b40cad83410653202c33ced4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/krasnodar.dgdat" || return 1
  
}
