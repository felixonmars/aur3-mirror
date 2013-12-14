pkgname=2gis-kirov
pkgver=23
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-23.orig.zip")
md5sums=('51b57941c7e02bbd8bbb060b0a417a29')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  
}
