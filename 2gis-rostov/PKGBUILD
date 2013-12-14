pkgname=2gis-rostov
pkgver=45
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-45.orig.zip")
md5sums=('e99b4dd9a4a99f74edfb745323c1668f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  
}
