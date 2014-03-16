pkgname=2gis-ntagil
pkgver=33
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-33.orig.zip")
md5sums=('f976916d6d2116450ebd169ce3b2a3a2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/ntagil.dgdat" || return 1
  
}
