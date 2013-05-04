pkgname=2gis-novokuznetsk
pkgver=93
pkgrel=2
pkgdesc="Map of Novokuznetsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-93.orig.zip")
md5sums=('8248b5a1958c35d9da545be2a26a6770')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Novokuznetsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/novokuznetsk.dglf" || return 1
}
