pkgname=2gis-barnaul
pkgver=104
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-104.orig.zip")
md5sums=('1dd0153dc0e307620c02aa19f4a64339')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/barnaul.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Barnaul.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/barnaul.dglf" || return 1
}
