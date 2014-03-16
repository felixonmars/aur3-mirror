pkgname=2gis-voronezh
pkgver=44
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-44.orig.zip")
md5sums=('b95426bde1e33d69f3568c227f051ee2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  
}
