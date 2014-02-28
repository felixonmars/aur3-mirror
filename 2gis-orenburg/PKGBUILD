pkgname=2gis-orenburg
pkgver=31
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-31.orig.zip")
md5sums=('c3891f976de0f02659a946e3afa7c18e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/orenburg.dgdat" || return 1
  
}
