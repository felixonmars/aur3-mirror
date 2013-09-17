pkgname=2gis-novokuznetsk
pkgver=97
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-97.orig.zip")
md5sums=('7fc1ccd125931914abff87fcd1c17f68')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Novokuznetsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/novokuznetsk.dglf" || return 1
}
