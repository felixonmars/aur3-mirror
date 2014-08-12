pkgname=2gis-oskol
pkgver=30
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/staryi-oskol/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Staroskol-30.orig.zip")
md5sums=('2ec6ed0101e56c3e080bea4565096a6a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/2gis-oskol.dgdat" || return 1
  
}
