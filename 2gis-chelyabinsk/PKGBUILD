pkgname=2gis-chelyabinsk
pkgver=83
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chelyabinsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Chelyabinsk-83.orig.zip")
md5sums=('cb39fc1294fc579ed2cd740b8854f646')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1
  
}
