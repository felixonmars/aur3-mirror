pkgname=2gis-kirov
pkgver=28
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-28.orig.zip")
md5sums=('b6b4a362bbd2e0e4301a381259ba616b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/2gis-kirov.dgdat" || return 1
  
}
