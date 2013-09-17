pkgname=2gis-bratsk
pkgver=24
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-24.orig.zip")
md5sums=('1929c8c76a1d39e9edfbd242ec9d3765')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/bratsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Bratsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/bratsk.dglf" || return 1
}
