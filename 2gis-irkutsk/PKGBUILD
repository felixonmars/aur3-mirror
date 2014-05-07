pkgname=2gis-irkutsk
pkgver=97
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-97.orig.zip")
md5sums=('e2fe500300ef8a78d4f3c07827480043')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/2gis-irkutsk.dgdat" || return 1
  
}
