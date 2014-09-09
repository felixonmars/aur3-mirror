pkgname=2gis-togliatti
pkgver=74
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/togliatti/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Togliatti-74.orig.zip")
md5sums=('089494de1929daae87488ab1f6224c0f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/2gis-togliatti.dgdat" || return 1
  
}
