pkgname=2gis-chita
pkgver=25
pkgrel=1
pkgdesc="Map of Chita for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://chita.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Chita-25.orig.zip")
md5sums=('718634426662ff820a98573f7e2a220b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chita.dgdat" "${pkgdir}/opt/2gis/2gis-chita.dgdat" || return 1
  
}
