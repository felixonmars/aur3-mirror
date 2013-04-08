pkgname=2gis-samara
pkgver=57
pkgrel=2
pkgdesc="Map of Samara for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Samara-57.orig.zip")
md5sums=('3c141439aaebb10b469606e2c4301e74')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Samara.dgdat "${pkgdir}/opt/2gis/samara.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Samara.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Samara.dglf" || return 1
}
