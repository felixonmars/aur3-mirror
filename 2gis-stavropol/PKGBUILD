pkgname=2gis-stavropol
pkgver=30
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/stavropol/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Stavropol-30.orig.zip")
md5sums=('534b8edef94427e8b58a44a0ce73a97e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/2gis-stavropol.dgdat" || return 1
  
}
