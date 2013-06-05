pkgname=2gis-novokuznetsk
pkgver=94
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-94.orig.zip")
md5sums=('4a550fe5c377b11c21c9fb4a43047e1a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Novokuznetsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/novokuznetsk.dglf" || return 1
}
