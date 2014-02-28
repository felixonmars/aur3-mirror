pkgname=2gis-kaliningrad
pkgver=36
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-36.orig.zip")
md5sums=('1db272ea22711f69197c5bd276f39c99')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/kaliningrad.dgdat" || return 1
  
}
