pkgname=2gis-novosibirsk
pkgver=191
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/novosibirsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Novosibirsk-191.orig.zip")
md5sums=('0a996a96c732c94d7de8adef2dfdee36')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/2gis-novosibirsk.dgdat" || return 1
  
}
