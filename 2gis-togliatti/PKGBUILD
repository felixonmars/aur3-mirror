pkgname=2gis-togliatti
pkgver=71
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/togliatti/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Togliatti-71.orig.zip")
md5sums=('24534253dfe25f483d97875a4feea03d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/2gis-togliatti.dgdat" || return 1
  
}
