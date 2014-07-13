pkgname=2gis-biysk
pkgver=69
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/biysk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Biysk-69.orig.zip")
md5sums=('cdcf8714e647618d353fcb6a832c2f58')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/2gis-biysk.dgdat" || return 1
  
}
