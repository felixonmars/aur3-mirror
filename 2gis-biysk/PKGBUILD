pkgname=2gis-biysk
pkgver=67
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-67.orig.zip")
md5sums=('fa672ecabcdb59f58e7ef2ee10362eb1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/2gis-biysk.dgdat" || return 1
  
}
