pkgname=2gis-chelyabinsk
pkgver=78
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-78.orig.zip")
md5sums=('7e2ae19fedb880797ce50e8404c85bf9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/chelyabinsk.dgdat" || return 1
  
}
