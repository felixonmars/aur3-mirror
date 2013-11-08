pkgname=2gis-chita
pkgver=19
pkgrel=1
pkgdesc="Map of Chita for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://chita.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Chita-19.orig.zip")
md5sums=('7489c7806063ecd8aeb97d3dc4c9f610')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chita.dgdat" "${pkgdir}/opt/2gis/chita.dgdat" || return 1
  
}
