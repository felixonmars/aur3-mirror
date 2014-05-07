pkgname=2gis-sochi
pkgver=46
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://sochi.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Sochi-46.orig.zip")
md5sums=('a1e677d6f1fae651a2c23455b5eece09')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/2gis-sochi.dgdat" || return 1
  
}
