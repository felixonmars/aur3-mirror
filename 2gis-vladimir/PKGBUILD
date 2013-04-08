pkgname=2gis-vladimir
pkgver=14
pkgrel=2
pkgdesc="Map of Vladimir for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-14.orig.zip")
md5sums=('f399239ad92ae853918e210d33300958')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Vladimir.dgdat "${pkgdir}/opt/2gis/vladimir.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Vladimir.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Vladimir.dglf" || return 1
}
