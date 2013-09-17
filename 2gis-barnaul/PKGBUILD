pkgname=2gis-barnaul
pkgver=103
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-103.orig.zip")
md5sums=('a66ff709d55a7a5790a4637af5d5d0ef')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/barnaul.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Barnaul.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/barnaul.dglf" || return 1
}
