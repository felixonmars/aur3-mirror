pkgname=2gis-omsk
pkgver=116
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-116.orig.zip")
md5sums=('f0a47f19876bf764d15649a370a5f262')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/2gis-omsk.dgdat" || return 1
  
}
