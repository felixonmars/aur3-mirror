pkgname=2gis-chelyabinsk
pkgver=74
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-74.orig.zip")
md5sums=('14b6ede03168b4ef30fa458e28000957')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/chelyabinsk.dglf" || return 1
}
