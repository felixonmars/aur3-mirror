pkgname=2gis-orenburg
pkgver=36
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/orenburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Orenburg-36.orig.zip")
md5sums=('5f80cf6456959ed949c369c5b3f97e00')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/2gis-orenburg.dgdat" || return 1
  
}
