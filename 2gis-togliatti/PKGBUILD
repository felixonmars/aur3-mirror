pkgname=2gis-togliatti
pkgver=72
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/togliatti/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Togliatti-72.orig.zip")
md5sums=('8e9827db260f43224d9f4bc865d55438')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/2gis-togliatti.dgdat" || return 1
  
}
