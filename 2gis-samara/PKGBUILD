pkgname=2gis-samara
pkgver=73
pkgrel=2
pkgdesc="Map of Samara for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/samara/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Samara-73.orig.zip")
md5sums=('56ce225fdb49aa515520caffdce16528')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Samara.dgdat" "${pkgdir}/opt/2gis/2gis-samara.dgdat" || return 1
  
}
