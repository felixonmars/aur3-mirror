pkgname=2gis-surgut
pkgver=26
pkgrel=2
pkgdesc="Map of Surgut for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-26.orig.zip")
md5sums=('9620163950560383fff6e8e0d984d721')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Surgut.dgdat "${pkgdir}/opt/2gis/surgut.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Surgut.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Surgut.dglf" || return 1
}
