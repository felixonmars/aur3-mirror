pkgname=2gis-novokuznetsk
pkgver=105
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-105.orig.zip")
md5sums=('ccb0f7967fa987da861c7f431f5d441f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/2gis-novokuznetsk.dgdat" || return 1
  
}
