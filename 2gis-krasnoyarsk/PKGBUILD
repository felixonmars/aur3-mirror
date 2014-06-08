pkgname=2gis-krasnoyarsk
pkgver=106
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/krasnoyarsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Krasnoyarsk-106.orig.zip")
md5sums=('3d7f111b702ccc4422d6b9079dd4c94a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/2gis-krasnoyarsk.dgdat" || return 1
  
}
