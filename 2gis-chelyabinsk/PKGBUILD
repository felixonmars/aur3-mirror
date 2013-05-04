pkgname=2gis-chelyabinsk
pkgver=69
pkgrel=2
pkgdesc="Map of Chelyabinsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-69.orig.zip")
md5sums=('aef5770e28a712d2724cf9ee747c7da1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/chelyabinsk.dglf" || return 1
}
