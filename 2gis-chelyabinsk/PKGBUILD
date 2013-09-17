pkgname=2gis-chelyabinsk
pkgver=73
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-73.orig.zip")
md5sums=('5947e018a874e4eeab561bd934dd2ea8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/chelyabinsk.dglf" || return 1
}
