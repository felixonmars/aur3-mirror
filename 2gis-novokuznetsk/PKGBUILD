pkgname=2gis-novokuznetsk
pkgver=92
pkgrel=2
pkgdesc="Map of Novokuznetsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-92.orig.zip")
md5sums=('03f969a65b4c2c3653afb17316e51e0f')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Novokuznetsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Novokuznetsk.dglf" || return 1
}
