pkgname=2gis-astrakhan
pkgver=89
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-89.orig.zip")
md5sums=('e4c9a19468f3bbd8731e55517e7d2852')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Astrakhan.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Astrakhan.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Astrakhan.dglf" || return 1
}
