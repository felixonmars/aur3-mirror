pkgname=2gis-togliatti
pkgver=63
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-63.orig.zip")
md5sums=('569d0adfcfcffdf993b2a70a2f289373')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Togliatti.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/togliatti.dglf" || return 1
}
