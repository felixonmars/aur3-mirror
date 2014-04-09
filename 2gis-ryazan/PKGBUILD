pkgname=2gis-ryazan
pkgver=36
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-36.orig.zip")
md5sums=('f4dba8845ae321f7ef6c1aa8558a850a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/2gis-ryazan.dgdat" || return 1
  
}
