pkgname=2gis-yakutsk
pkgver=37
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/yakutsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Yakutsk-37.orig.zip")
md5sums=('f83d105753543d65c65db9bedae91d08')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/2gis-yakutsk.dgdat" || return 1
  
}
