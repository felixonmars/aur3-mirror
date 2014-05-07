pkgname=2gis-surgut
pkgver=39
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-39.orig.zip")
md5sums=('427da2aba463f241896b936ef8eacfe9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/2gis-surgut.dgdat" || return 1
  
}
