pkgname=2gis-syktyvkar
pkgver=15
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-15.orig.zip")
md5sums=('589cac382e5febc3f6c99d155874be62')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/syktyvkar.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Syktyvkar.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/syktyvkar.dglf" || return 1
}
