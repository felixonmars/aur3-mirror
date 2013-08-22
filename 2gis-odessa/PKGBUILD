pkgname=2gis-odessa
pkgver=78
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-78.orig.zip")
md5sums=('615be7c4d72e2f79d37aa4697a90fab2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Odessa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/odessa.dglf" || return 1
}
