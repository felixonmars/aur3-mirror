pkgname=2gis-togliatti
pkgver=76
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/togliatti/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Togliatti-76.orig.zip")
md5sums=('cbeeb9cd6e0f05b6b2c2bba6fe83bce1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/2gis-togliatti.dgdat" || return 1
  
}
