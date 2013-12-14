pkgname=2gis-surgut
pkgver=34
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-34.orig.zip")
md5sums=('990446938f25b57ff96d2d1b120cd271')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/surgut.dgdat" || return 1
  
}
