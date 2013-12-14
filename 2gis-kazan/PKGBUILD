pkgname=2gis-kazan
pkgver=61
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-61.orig.zip")
md5sums=('477d2a1925d556bb20d279c7f0986a5c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/kazan.dgdat" || return 1
  
}
