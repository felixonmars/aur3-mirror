pkgname=2gis-odessa
pkgver=80
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-80.orig.zip")
md5sums=('9ef20d331969ffeecd3bc15b8814af3a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Odessa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/odessa.dglf" || return 1
}
