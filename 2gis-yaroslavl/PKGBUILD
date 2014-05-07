pkgname=2gis-yaroslavl
pkgver=47
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-47.orig.zip")
md5sums=('b2d2a33ccbb1f700bba09c7931ffa46c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/2gis-yaroslavl.dgdat" || return 1
  
}
