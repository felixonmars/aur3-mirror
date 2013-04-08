pkgname=2gis-saratov
pkgver=24
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-24.orig.zip")
md5sums=('024e99477177baf4f45b5ed9bea2d72d')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Saratov.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Saratov.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Saratov.dglf" || return 1
}
