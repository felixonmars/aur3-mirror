pkgname=2gis-spb
pkgver=37
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Spb-37.orig.zip")
md5sums=('3ec881339f23abe416966bd018ff9a39')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  
}
