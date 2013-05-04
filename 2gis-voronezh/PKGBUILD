pkgname=2gis-voronezh
pkgver=34
pkgrel=2
pkgdesc="Map of Voronezh for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-34.orig.zip")
md5sums=('a5e02d2ac4a896896bb0b3b163d9db0d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Voronezh.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/voronezh.dglf" || return 1
}
