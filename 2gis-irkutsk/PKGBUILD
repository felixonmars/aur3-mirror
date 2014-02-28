pkgname=2gis-irkutsk
pkgver=94
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-94.orig.zip")
md5sums=('a3985255c973c2e4371c9679f6b09a64')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/irkutsk.dgdat" || return 1
  
}
