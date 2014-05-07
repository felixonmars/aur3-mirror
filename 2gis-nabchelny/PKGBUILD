pkgname=2gis-nabchelny
pkgver=47
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://naberezhnye-chelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-47.orig.zip")
md5sums=('b5a5d599353d7fe1496a2d8a72652bd0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/2gis-nabchelny.dgdat" || return 1
  
}
