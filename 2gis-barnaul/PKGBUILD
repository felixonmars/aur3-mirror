pkgname=2gis-barnaul
pkgver=98
pkgrel=2
pkgdesc="Map of Barnaul for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-98.orig.zip")
md5sums=('c6fa2b71bd7ad9cfabbb609b3b0aa850')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Barnaul.dgdat "${pkgdir}/opt/2gis/barnaul.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Barnaul.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Barnaul.dglf" || return 1
}
