pkgname=2gis-tula
pkgver=31
pkgrel=1
pkgdesc="Map of Tula for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tula-31.orig.zip")
md5sums=('5c533ed1a6d7f32cffcfec6b273669cb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tula.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tula.dglf" || return 1
}
