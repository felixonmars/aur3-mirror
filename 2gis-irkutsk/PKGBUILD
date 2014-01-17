pkgname=2gis-irkutsk
pkgver=93
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-93.orig.zip")
md5sums=('af9f420eeca58f27e47ede781653d262')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/irkutsk.dgdat" || return 1
  
}
