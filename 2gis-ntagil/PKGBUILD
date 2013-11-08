pkgname=2gis-ntagil
pkgver=29
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-29.orig.zip")
md5sums=('3734170bafee43f3912d5c88c3328bcc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/ntagil.dgdat" || return 1
  
}
