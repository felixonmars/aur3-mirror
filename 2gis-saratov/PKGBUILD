pkgname=2gis-saratov
pkgver=35
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-35.orig.zip")
md5sums=('fd63ecf6b54dfdecfd602e2288d8ee02')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/saratov.dgdat" || return 1
  
}
