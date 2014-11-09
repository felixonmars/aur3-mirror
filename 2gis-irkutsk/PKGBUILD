pkgname=2gis-irkutsk
pkgver=103
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/irkutsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Irkutsk-103.orig.zip")
md5sums=('79236e65b5db3d8a4b3b3a59c8ab4607')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/2gis-irkutsk.dgdat" || return 1
  
}
