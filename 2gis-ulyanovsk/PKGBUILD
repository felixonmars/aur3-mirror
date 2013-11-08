pkgname=2gis-ulyanovsk
pkgver=24
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://ulyanovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulyanovsk-24.orig.zip")
md5sums=('9aa4d96d2cc8e0991c925fe910ae1f21')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulyanovsk.dgdat" "${pkgdir}/opt/2gis/ulyanovsk.dgdat" || return 1
  
}
