pkgname=2gis-perm
pkgver=64
pkgrel=2
pkgdesc="Map of Perm for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://perm.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Perm-64.orig.zip")
md5sums=('8d7d079e7f2d22b9a10713f1d95b9376')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Perm.dgdat "${pkgdir}/opt/2gis/perm.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Perm.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Perm.dglf" || return 1
}
