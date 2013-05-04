pkgname=2gis-volgograd
pkgver=32
pkgrel=2
pkgdesc="Map of Volgograd for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-32.orig.zip")
md5sums=('1877f97858bce5a77333c856db5c006b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/volgograd.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Volgograd.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/volgograd.dglf" || return 1
}
