pkgname=2gis-cheboksary
pkgver=18
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-18.orig.zip")
md5sums=('18959aa2447c4c754b66f0973f1e817b')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Cheboksary.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Cheboksary.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Cheboksary.dglf" || return 1
}
