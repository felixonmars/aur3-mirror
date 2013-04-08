pkgname=2gis-penza
pkgver=24
pkgrel=1
pkgdesc="Map of Penza for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Penza-24.orig.zip")
md5sums=('380fb52af17dedc3990a5c2a25bda7ff')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Penza.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Penza.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Penza.dglf" || return 1
}
