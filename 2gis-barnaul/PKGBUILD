pkgname=2gis-barnaul
pkgver=117
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/barnaul/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Barnaul-117.orig.zip")
md5sums=('eb459be8f5ccedf80f35564ac74f7f92')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/2gis-barnaul.dgdat" || return 1
  
}
