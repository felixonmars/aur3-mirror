pkgname=2gis-izhevsk
pkgver=37
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-37.orig.zip")
md5sums=('c50d298a6ef46a9052d4669027ccdf2c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/2gis-izhevsk.dgdat" || return 1
  
}
