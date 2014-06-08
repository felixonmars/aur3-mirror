pkgname=2gis-odessa
pkgver=88
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ua/odessa/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-88.orig.zip")
md5sums=('5a8c8632e08ef35a8e33ff2172ee228f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/2gis-odessa.dgdat" || return 1
  
}
