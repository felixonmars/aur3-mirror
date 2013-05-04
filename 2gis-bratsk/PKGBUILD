pkgname=2gis-bratsk
pkgver=20
pkgrel=2
pkgdesc="Map of Bratsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-20.orig.zip")
md5sums=('51937f640d11d2223d4d7388cff0f04b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/bratsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Bratsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/bratsk.dglf" || return 1
}
