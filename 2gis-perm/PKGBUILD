pkgname=2gis-perm
pkgver=68
pkgrel=1
pkgdesc="Map of Perm for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://perm.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Perm-68.orig.zip")
md5sums=('c97de81038b56cf01543594cdf305fe5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Perm.dgdat" "${pkgdir}/opt/2gis/perm.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Perm.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/perm.dglf" || return 1
}
