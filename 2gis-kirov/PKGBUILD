pkgname=2gis-kirov
pkgver=21
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-21.orig.zip")
md5sums=('bf11435f5176350c62621b7e4e0958b7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kirov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kirov.dglf" || return 1
}
