pkgname=2gis-krasnodar
pkgver=49
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-49.orig.zip")
md5sums=('e2707fcc83f655b03669ca0d34cb33fa')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/krasnodar.dgdat" || return 1
  
}
