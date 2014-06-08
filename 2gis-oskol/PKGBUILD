pkgname=2gis-oskol
pkgver=28
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/staryi-oskol/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Staroskol-28.orig.zip")
md5sums=('f47dce51c97111f6c3a5b7bd2f681aa8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/2gis-oskol.dgdat" || return 1
  
}
