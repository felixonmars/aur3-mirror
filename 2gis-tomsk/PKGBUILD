pkgname=2gis-tomsk
pkgver=106
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://tomsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Tomsk-106.orig.zip")
md5sums=('0ac6ffd374e91c009d62bb1d5c3e5b51')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/tomsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tomsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tomsk.dglf" || return 1
}
