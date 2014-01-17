pkgname=2gis-odessa
pkgver=83
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-83.orig.zip")
md5sums=('f2c1ff89c940419b884f362dc4ab1b1a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  
}
