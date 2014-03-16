pkgname=2gis-biysk
pkgver=65
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-65.orig.zip")
md5sums=('0da06789a8611159eb176b188a30b69f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/biysk.dgdat" || return 1
  
}
