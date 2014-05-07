pkgname=2gis-voronezh
pkgver=46
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-46.orig.zip")
md5sums=('02005a828fcbbc2506b068276841a6a7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/2gis-voronezh.dgdat" || return 1
  
}
