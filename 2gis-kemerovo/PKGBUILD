pkgname=2gis-kemerovo
pkgver=100
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-100.orig.zip")
md5sums=('ea2b5c902161c5e6ada54b89e2b7eda0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/kemerovo.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kemerovo.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kemerovo.dglf" || return 1
}
