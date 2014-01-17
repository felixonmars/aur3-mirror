pkgname=2gis-krasnoyarsk
pkgver=101
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-101.orig.zip")
md5sums=('e17b95cf712f00f2fa53de9f5d130c78')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  
}
