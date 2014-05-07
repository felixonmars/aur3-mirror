pkgname=2gis-ntagil
pkgver=35
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://nizhniy-tagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-35.orig.zip")
md5sums=('092d6dcf97a143375c2a68d64cbb8b45')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/2gis-ntagil.dgdat" || return 1
  
}
