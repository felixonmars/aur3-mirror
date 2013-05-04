pkgname=2gis-astrakhan
pkgver=90
pkgrel=2
pkgdesc="Map of Astrakhan for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-90.orig.zip")
md5sums=('13b9f4f359a5ad2c27043c00f8d2d356')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Astrakhan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/astrakhan.dglf" || return 1
}
