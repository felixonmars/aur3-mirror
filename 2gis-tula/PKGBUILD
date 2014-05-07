pkgname=2gis-tula
pkgver=42
pkgrel=1
pkgdesc="Map of Tula for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Tula-42.orig.zip")
md5sums=('a03e63ea3ecc539f622d1984183783bf')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/2gis-tula.dgdat" || return 1
  
}
