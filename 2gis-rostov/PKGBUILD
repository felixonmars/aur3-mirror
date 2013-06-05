pkgname=2gis-rostov
pkgver=39
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-39.orig.zip")
md5sums=('76a514cd1de3206a0a4a26c687233d2c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Rostov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/rostov.dglf" || return 1
}
