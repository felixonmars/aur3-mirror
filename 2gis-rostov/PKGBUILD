pkgname=2gis-rostov
pkgver=37
pkgrel=2
pkgdesc="Map of Rostov-na-Donu for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-37.orig.zip")
md5sums=('644213dbd38536f087a12e1f2b401c9b')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Rostov-na-Donu.dgdat "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Rostov-na-Donu.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Rostov-na-Donu.dglf" || return 1
}
