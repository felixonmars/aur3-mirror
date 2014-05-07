pkgname=2gis-ryazan
pkgver=37
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-37.orig.zip")
md5sums=('154898caf8b704c48932db7c06b6b872')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/2gis-ryazan.dgdat" || return 1
  
}
