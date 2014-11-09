pkgname=2gis-oskol
pkgver=33
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/staryi-oskol/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Staroskol-33.orig.zip")
md5sums=('8a946eff8ffb0ee06336021b5c6ff2d0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/2gis-oskol.dgdat" || return 1
  
}
