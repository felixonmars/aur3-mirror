pkgname=2gis-novosibirsk
pkgver=179
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-179.orig.zip")
md5sums=('473b5b0447dbe07d1398ca4c08ba4633')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/novosibirsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Novosibirsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/novosibirsk.dglf" || return 1
}
