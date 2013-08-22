pkgname=2gis-krasnoyarsk
pkgver=96
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-96.orig.zip")
md5sums=('1fc8e6b0d4b43a3f699cdd7a601b3cff')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnoyarsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/krasnoyarsk.dglf" || return 1
}
