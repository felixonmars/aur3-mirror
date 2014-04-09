pkgname=2gis-orenburg
pkgver=33
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-33.orig.zip")
md5sums=('af994e259d67d8f0e573d2aa70c8d861')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/2gis-orenburg.dgdat" || return 1
  
}
