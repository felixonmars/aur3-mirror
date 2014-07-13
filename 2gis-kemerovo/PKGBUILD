pkgname=2gis-kemerovo
pkgver=111
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kemerovo/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kemerovo-111.orig.zip")
md5sums=('1ef0a44680096dc4cf962a763fc59dc1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/2gis-kemerovo.dgdat" || return 1
  
}
