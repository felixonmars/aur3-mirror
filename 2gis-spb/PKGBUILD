pkgname=2gis-spb
pkgver=28
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Spb-28.orig.zip")
md5sums=('d6a6f2bbb1241e965b3d59fab2eb034f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Spb.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/spb.dglf" || return 1
}
