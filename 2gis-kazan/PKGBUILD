pkgname=2gis-kazan
pkgver=60
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-60.orig.zip")
md5sums=('48a3a58ea1e6ac4612a8231ca23ec992')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/kazan.dgdat" || return 1
  
}
