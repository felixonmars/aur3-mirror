pkgname=2gis-chita
pkgver=24
pkgrel=1
pkgdesc="Map of Chita for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://chita.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Chita-24.orig.zip")
md5sums=('992376d710d18392ba27aab30d9a406f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chita.dgdat" "${pkgdir}/opt/2gis/2gis-chita.dgdat" || return 1
  
}
