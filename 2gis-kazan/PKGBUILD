pkgname=2gis-kazan
pkgver=63
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-63.orig.zip")
md5sums=('66ffcba1de0342ac5d340870a1c0a578')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/kazan.dgdat" || return 1
  
}
