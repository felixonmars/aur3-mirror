pkgname=2gis-surgut
pkgver=35
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-35.orig.zip")
md5sums=('229a9aa629da293292c3a9e9626334a4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/surgut.dgdat" || return 1
  
}
