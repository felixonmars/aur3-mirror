pkgname=2gis-nizhnevartovsk
pkgver=96
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://nizhnevartovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-96.orig.zip")
md5sums=('35424ba50db575650f0551acb196955f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nizhnevartovsk.dgdat" "${pkgdir}/opt/2gis/2gis-nizhnevartovsk.dgdat" || return 1
  
}
