pkgname=2gis-stavropol
pkgver=28
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-28.orig.zip")
md5sums=('3d4e703953e129156b35ff981a9600d4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/2gis-stavropol.dgdat" || return 1
  
}
