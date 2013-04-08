pkgname=2gis-togliatti
pkgver=57
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-57.orig.zip")
md5sums=('40583b316de8f1502288cbb8194e66a4')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Togliatti.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Togliatti.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Togliatti.dglf" || return 1
}
