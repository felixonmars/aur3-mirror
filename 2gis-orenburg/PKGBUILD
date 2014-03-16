pkgname=2gis-orenburg
pkgver=32
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-32.orig.zip")
md5sums=('379ab25bb3f2378bad7f2a4a08bef16e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/orenburg.dgdat" || return 1
  
}
