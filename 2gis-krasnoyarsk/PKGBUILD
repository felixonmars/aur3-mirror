pkgname=2gis-krasnoyarsk
pkgver=104
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-104.orig.zip")
md5sums=('6acafc84af2f28ba1a04ea159be5f0a6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/2gis-krasnoyarsk.dgdat" || return 1
  
}
