pkgname=2gis-volgograd
pkgver=34
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-34.orig.zip")
md5sums=('b2858f2e959151c0229c776ea3f0ea05')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/volgograd.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Volgograd.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/volgograd.dglf" || return 1
}
