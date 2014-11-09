pkgname=2gis-yaroslavl
pkgver=53
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/yaroslavl/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Yaroslavl-53.orig.zip")
md5sums=('bec5e2eb27619f2943ee91e9eb900b6e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/2gis-yaroslavl.dgdat" || return 1
  
}
