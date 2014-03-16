pkgname=2gis-surgut
pkgver=37
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-37.orig.zip")
md5sums=('d53cdfd8863e7b6d2ddce8c32b3128db')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/surgut.dgdat" || return 1
  
}
