pkgname=2gis-kaliningrad
pkgver=39
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-39.orig.zip")
md5sums=('225e71a43a18a0bf071cc19560c36cce')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/2gis-kaliningrad.dgdat" || return 1
  
}
