pkgname=2gis-astrakhan
pkgver=93
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-93.orig.zip")
md5sums=('9559a9ae1f8fcd394ea96f2bac81c85b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Astrakhan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/astrakhan.dglf" || return 1
}
