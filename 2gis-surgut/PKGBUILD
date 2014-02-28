pkgname=2gis-surgut
pkgver=36
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-36.orig.zip")
md5sums=('9b18803e00f93040134c1dc8db0942e9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/surgut.dgdat" || return 1
  
}
