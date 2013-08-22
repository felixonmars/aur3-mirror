pkgname=2gis-tver
pkgver=25
pkgrel=1
pkgdesc="Map of Tver for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tver-25.orig.zip")
md5sums=('c87bbb4ad731a1ff62518092ed198d61')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tver.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tver.dglf" || return 1
}
