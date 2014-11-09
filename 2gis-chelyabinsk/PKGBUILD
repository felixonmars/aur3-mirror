pkgname=2gis-chelyabinsk
pkgver=87
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chelyabinsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Chelyabinsk-87.orig.zip")
md5sums=('1f29616802b869a99fc2200fdbb13a88')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1
  
}
