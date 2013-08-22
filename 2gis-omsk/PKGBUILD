pkgname=2gis-omsk
pkgver=108
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-108.orig.zip")
md5sums=('c74c4c59634764d035c5985b40389f71')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Omsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/omsk.dglf" || return 1
}
