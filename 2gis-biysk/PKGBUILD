pkgname=2gis-biysk
pkgver=62
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-62.orig.zip")
md5sums=('abb13bf63993ec13bb139f5d17fdce38')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/biysk.dgdat" || return 1
  
}
