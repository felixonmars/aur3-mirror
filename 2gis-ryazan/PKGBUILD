pkgname=2gis-ryazan
pkgver=24
pkgrel=2
pkgdesc="Map of Ryazan for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-24.orig.zip")
md5sums=('98043b8558c84b9bc0ac308e54cc4392')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Ryazan.dgdat "${pkgdir}/opt/2gis/ryazan.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Ryazan.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Ryazan.dglf" || return 1
}
