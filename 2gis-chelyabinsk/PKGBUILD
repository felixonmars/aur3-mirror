pkgname=2gis-chelyabinsk
pkgver=82
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chelyabinsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Chelyabinsk-82.orig.zip")
md5sums=('ff6eee1e68f048de042ead04918f7edc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1
  
}
