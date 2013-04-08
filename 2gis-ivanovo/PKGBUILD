pkgname=2gis-ivanovo
pkgver=12
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-12.orig.zip")
md5sums=('589702f83678ab5403cc61cb478406cb')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Ivanovo.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  
}
