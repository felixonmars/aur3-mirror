pkgname=2gis-kaliningrad
pkgver=41
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kaliningrad/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kaliningrad-41.orig.zip")
md5sums=('91b1fd32224ec53c8afa54e52cfaad59')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/2gis-kaliningrad.dgdat" || return 1
  
}
