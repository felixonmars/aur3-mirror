pkgname=2gis-kazan
pkgver=65
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-65.orig.zip")
md5sums=('26b70304b181e7294418c80ac74fe530')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/2gis-kazan.dgdat" || return 1
  
}
