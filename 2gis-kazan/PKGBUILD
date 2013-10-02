pkgname=2gis-kazan
pkgver=59
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-59.orig.zip")
md5sums=('0f6a06eadba9f5789e5f2dd7a5c03c4f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/kazan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kazan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kazan.dglf" || return 1
}
