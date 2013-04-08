pkgname=2gis-krasnodar
pkgver=39
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-39.orig.zip")
md5sums=('f9386435b76a2fa3332f8c0a89fab891')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Krasnodar.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Krasnodar.dglf" || return 1
}
