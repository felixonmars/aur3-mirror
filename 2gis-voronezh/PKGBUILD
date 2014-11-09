pkgname=2gis-voronezh
pkgver=52
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/voronezh/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Voronezh-52.orig.zip")
md5sums=('f9eff1c38c3ae8aeb5e32cde27c92e95')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/2gis-voronezh.dgdat" || return 1
  
}
