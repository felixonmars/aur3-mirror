pkgname=2gis-ulanude
pkgver=43
pkgrel=1
pkgdesc="Map of Ulan-Ude for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ulan-ude/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Ulanude-43.orig.zip")
md5sums=('132054ecefd0f78da948d730eb2f6ed0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulanude.dgdat" "${pkgdir}/opt/2gis/2gis-ulanude.dgdat" || return 1
  
}
