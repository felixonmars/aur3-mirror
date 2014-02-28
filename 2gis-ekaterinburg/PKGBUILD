pkgname=2gis-ekaterinburg
pkgver=98
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-98.orig.zip")
md5sums=('e221302e76a735a683d93e46385361dc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  
}
