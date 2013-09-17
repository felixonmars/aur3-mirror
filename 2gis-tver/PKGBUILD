pkgname=2gis-tver
pkgver=26
pkgrel=1
pkgdesc="Map of Tver for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tver-26.orig.zip")
md5sums=('ae043937f5af4dde1dc6d21a1cd9c7fc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tver.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tver.dglf" || return 1
}
