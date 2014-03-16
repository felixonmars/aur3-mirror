pkgname=2gis-odessa
pkgver=85
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-85.orig.zip")
md5sums=('f0ae0071abd6bbd27cdad35a969c9398')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  
}
