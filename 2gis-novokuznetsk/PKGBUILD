pkgname=2gis-novokuznetsk
pkgver=109
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/novokuznetsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Novokuznetsk-109.orig.zip")
md5sums=('6ae73a465bfcaa8408246642ab87e768')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/2gis-novokuznetsk.dgdat" || return 1
  
}
