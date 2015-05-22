pkgname=2gis-chelyabinsk
pkgver=93
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, May 2015"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chelyabinsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Chelyabinsk-${pkgver}.orig.zip")
md5sums=('SKIP')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1
  
}
