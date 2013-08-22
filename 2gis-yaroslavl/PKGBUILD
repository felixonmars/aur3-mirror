pkgname=2gis-yaroslavl
pkgver=38
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-38.orig.zip")
md5sums=('5c6a35fbd88dfb2e9ac61a80bdf9abc4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/yaroslavl.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yaroslavl.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yaroslavl.dglf" || return 1
}
