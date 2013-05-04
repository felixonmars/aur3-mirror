pkgname=2gis-rostov
pkgver=38
pkgrel=2
pkgdesc="Map of Rostov-na-Donu for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-38.orig.zip")
md5sums=('cb124f8262b5b5ca1944856cfe5603cd')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Rostov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/rostov.dglf" || return 1
}
