pkgname=2gis-chelyabinsk
pkgver=94
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, June 2015"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chelyabinsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Chelyabinsk-${pkgver}.orig.zip")
md5sums=('16a28d0b8e3f2befee31ba5e0f5f1c53')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1 
}
