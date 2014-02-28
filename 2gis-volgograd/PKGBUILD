pkgname=2gis-volgograd
pkgver=41
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-41.orig.zip")
md5sums=('19e4bed67c675df52c2c209077e78c07')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/volgograd.dgdat" || return 1
  
}
