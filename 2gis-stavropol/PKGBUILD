pkgname=2gis-stavropol
pkgver=31
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/stavropol/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Stavropol-31.orig.zip")
md5sums=('78977ca67d0a9a7b8f1ab159f3714bd8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/2gis-stavropol.dgdat" || return 1
  
}
