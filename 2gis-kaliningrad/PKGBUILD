pkgname=2gis-kaliningrad
pkgver=38
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-38.orig.zip")
md5sums=('6e9fb26e562863c4a5a3f7df10be816f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/2gis-kaliningrad.dgdat" || return 1
  
}
