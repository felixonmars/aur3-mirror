pkgname=2gis-ivanovo
pkgver=25
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-25.orig.zip")
md5sums=('613d2a0a0acd1d4f748cb28e564d3a88')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/2gis-ivanovo.dgdat" || return 1
  
}
