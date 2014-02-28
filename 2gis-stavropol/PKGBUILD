pkgname=2gis-stavropol
pkgver=26
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-26.orig.zip")
md5sums=('1dcdbe2f9a9f17b01dc38c88bdca4e96')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/stavropol.dgdat" || return 1
  
}
