pkgname=2gis-smolensk
pkgver=10
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-10.orig.zip")
md5sums=('5d69449b707975d51ffef915a13e7b56')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Smolensk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Smolensk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Smolensk.dglf" || return 1
}
