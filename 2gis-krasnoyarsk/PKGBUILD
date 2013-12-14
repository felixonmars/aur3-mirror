pkgname=2gis-krasnoyarsk
pkgver=100
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-100.orig.zip")
md5sums=('aaf86028634f1c8fbe7534bbaa5b18ee')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  
}
