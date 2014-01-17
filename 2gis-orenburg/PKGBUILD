pkgname=2gis-orenburg
pkgver=30
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-30.orig.zip")
md5sums=('dda732d8b09f44e034bfbcc7d5862d7f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/orenburg.dgdat" || return 1
  
}
