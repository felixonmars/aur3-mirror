pkgname=2gis-ivanovo
pkgver=13
pkgrel=2
pkgdesc="Map of Ivanovo for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-13.orig.zip")
md5sums=('230c767baa60b9e1be49d39166d28b19')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/ivanovo.dgdat" || return 1
  
}
