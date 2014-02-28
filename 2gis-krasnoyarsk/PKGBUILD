pkgname=2gis-krasnoyarsk
pkgver=102
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-102.orig.zip")
md5sums=('0b8fed442bf4f7aac8e46729e280f6e8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/krasnoyarsk.dgdat" || return 1
  
}
