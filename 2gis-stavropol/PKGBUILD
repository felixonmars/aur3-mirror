pkgname=2gis-stavropol
pkgver=25
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-25.orig.zip")
md5sums=('2e0f13d0f6a40c5f8718b77171a6eeda')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/stavropol.dgdat" || return 1
  
}
