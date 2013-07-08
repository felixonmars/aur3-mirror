pkgname=2gis-barnaul
pkgver=101
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-101.orig.zip")
md5sums=('070feb4fb2c7a1139e1c4011a2cef3a7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/barnaul.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Barnaul.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/barnaul.dglf" || return 1
}
