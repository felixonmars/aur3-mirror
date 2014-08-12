pkgname=2gis-orenburg
pkgver=37
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/orenburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Orenburg-37.orig.zip")
md5sums=('f3392af4e71dfb922a9b1735641ecd3b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/2gis-orenburg.dgdat" || return 1
  
}
