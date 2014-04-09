pkgname=2gis-ivanovo
pkgver=24
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-24.orig.zip")
md5sums=('82c69422930762669c4771e0000fdf2b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/2gis-ivanovo.dgdat" || return 1
  
}
