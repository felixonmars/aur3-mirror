pkgname=2gis-rostov
pkgver=48
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-48.orig.zip")
md5sums=('cd9ed8afd1366522d77b42cffbfcd41b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  
}
