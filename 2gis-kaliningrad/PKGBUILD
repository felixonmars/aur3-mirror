pkgname=2gis-kaliningrad
pkgver=33
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-33.orig.zip")
md5sums=('af62dd5eb611fe4d0e167c3632a39d23')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/kaliningrad.dgdat" || return 1
  
}
