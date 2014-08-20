pkgname=2gis-odessa
pkgver=90
pkgrel=2
pkgdesc="Map of Odessa for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ua/odessa/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-90.orig.zip")
md5sums=('cc0ab5883c7c028017c8729b630853d5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/2gis-odessa.dgdat" || return 1
  
}
