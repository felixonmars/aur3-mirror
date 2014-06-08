pkgname=2gis-ulyanovsk
pkgver=31
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ulyanovsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Ulyanovsk-31.orig.zip")
md5sums=('0389d2a105825deb67eedf3364374265')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulyanovsk.dgdat" "${pkgdir}/opt/2gis/2gis-ulyanovsk.dgdat" || return 1
  
}
