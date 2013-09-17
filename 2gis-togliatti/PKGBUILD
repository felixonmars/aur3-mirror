pkgname=2gis-togliatti
pkgver=62
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-62.orig.zip")
md5sums=('c6889fc2ff71dae2583606ce853f0090')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Togliatti.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/togliatti.dglf" || return 1
}
