pkgname=2gis-chelyabinsk
pkgver=85
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chelyabinsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Chelyabinsk-85.orig.zip")
md5sums=('3c242189368cfcf9dafb08490e2747e2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1
  
}
