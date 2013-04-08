pkgname=2gis-kazan
pkgver=53
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-53.orig.zip")
md5sums=('e4097badfe52cd86238c3189cc8969a9')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Kazan.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Kazan.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Kazan.dglf" || return 1
}
