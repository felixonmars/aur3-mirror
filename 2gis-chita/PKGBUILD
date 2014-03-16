pkgname=2gis-chita
pkgver=23
pkgrel=1
pkgdesc="Map of Chita for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://chita.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Chita-23.orig.zip")
md5sums=('98db9686ce4c42b40fbd2c5fd7b636f0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chita.dgdat" "${pkgdir}/opt/2gis/chita.dgdat" || return 1
  
}
