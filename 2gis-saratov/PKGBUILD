pkgname=2gis-saratov
pkgver=38
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/saratov/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Saratov-38.orig.zip")
md5sums=('49fbe3323917d48ca2b535bd583016f5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/2gis-saratov.dgdat" || return 1
  
}
