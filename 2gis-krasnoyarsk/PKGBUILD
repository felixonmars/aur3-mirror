pkgname=2gis-krasnoyarsk
pkgver=93
pkgrel=2
pkgdesc="Map of Krasnoyarsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-93.orig.zip")
md5sums=('c6ef4d0a76df4487774a422a138b5d35')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnoyarsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/krasnoyarsk.dglf" || return 1
}
