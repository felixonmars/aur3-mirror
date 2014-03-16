pkgname=2gis-ulyanovsk
pkgver=28
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://ulyanovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulyanovsk-28.orig.zip")
md5sums=('75ee6a13b2aaa6387d4a9645aaee5cb7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulyanovsk.dgdat" "${pkgdir}/opt/2gis/ulyanovsk.dgdat" || return 1
  
}
