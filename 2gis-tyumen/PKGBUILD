pkgname=2gis-tyumen
pkgver=92
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tyumen/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Tyumen-92.orig.zip")
md5sums=('132ae19fef1817f1a624b63e4a7a53d9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/2gis-tyumen.dgdat" || return 1
  
}
