pkgname=2gis-krasnodar
pkgver=43
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-43.orig.zip")
md5sums=('baff8fccb174ddac7598a886effc24a3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/krasnodar.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/krasnodar.dglf" || return 1
}
