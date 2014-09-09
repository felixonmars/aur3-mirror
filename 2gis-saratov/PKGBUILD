pkgname=2gis-saratov
pkgver=41
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/saratov/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Saratov-41.orig.zip")
md5sums=('d70cf6eab098b9a9b7e07f16062e155d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/2gis-saratov.dgdat" || return 1
  
}
