pkgname=2gis-krasnoyarsk
pkgver=92
pkgrel=2
pkgdesc="Map of Krasnoyarsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-92.orig.zip")
md5sums=('c5004039263ef252c6144704a9703595')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnoyarsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Krasnoyarsk.dglf" || return 1
}
