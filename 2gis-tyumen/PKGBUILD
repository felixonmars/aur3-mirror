pkgname=2gis-tyumen
pkgver=83
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-83.orig.zip")
md5sums=('59ef9e54508ec60b04f4ba681650e0ee')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/tyumen.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tyumen.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tyumen.dglf" || return 1
}
