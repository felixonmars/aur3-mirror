pkgname=2gis-togliatti
pkgver=58
pkgrel=2
pkgdesc="Map of Togliatti for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-58.orig.zip")
md5sums=('dd04402fca5ae915fd6ec0a7f8150247')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Togliatti.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/togliatti.dglf" || return 1
}
