pkgname=2gis-kemerovo
pkgver=110
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kemerovo/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Kemerovo-110.orig.zip")
md5sums=('f4f4af0d04288c1c2c5d67dee3499922')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/2gis-kemerovo.dgdat" || return 1
  
}
