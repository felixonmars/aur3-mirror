pkgname=2gis-krasnoyarsk
pkgver=98
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-98.orig.zip")
md5sums=('8e052c6774f1c7be8b6544dced71b62b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnoyarsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/krasnoyarsk.dglf" || return 1
}
