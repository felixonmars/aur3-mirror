pkgname=2gis-volgograd
pkgver=44
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-44.orig.zip")
md5sums=('f86a7c259fc379860b30e43ec364863c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/2gis-volgograd.dgdat" || return 1
  
}
