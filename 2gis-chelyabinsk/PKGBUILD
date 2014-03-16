pkgname=2gis-chelyabinsk
pkgver=79
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-79.orig.zip")
md5sums=('fb36d4b1b30c0919343241d5f2a4ec4f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/chelyabinsk.dgdat" || return 1
  
}
