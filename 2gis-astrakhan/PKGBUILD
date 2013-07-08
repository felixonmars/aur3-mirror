pkgname=2gis-astrakhan
pkgver=92
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-92.orig.zip")
md5sums=('76e1467188b4eb74c86f2d1cf045bde2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Astrakhan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/astrakhan.dglf" || return 1
}
