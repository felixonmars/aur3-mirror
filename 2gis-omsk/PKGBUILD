pkgname=2gis-omsk
pkgver=105
pkgrel=2
pkgdesc="Map of Omsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-105.orig.zip")
md5sums=('a0c4733049a3b0ebf5cc4e2949bf528e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Omsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/omsk.dglf" || return 1
}
