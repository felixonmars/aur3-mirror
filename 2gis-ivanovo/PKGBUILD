pkgname=2gis-ivanovo
pkgver=15
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-15.orig.zip")
md5sums=('9185d27fdc9e666c9829e0cec890d8cd')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/ivanovo.dgdat" || return 1
  
}
