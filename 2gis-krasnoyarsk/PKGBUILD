pkgname=2gis-krasnoyarsk
pkgver=97
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-97.orig.zip")
md5sums=('fc2b6fa786fd6da1926aee0b91ba00ac')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnoyarsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/krasnoyarsk.dglf" || return 1
}
