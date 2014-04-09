pkgname=2gis-bratsk
pkgver=31
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-31.orig.zip")
md5sums=('c1e246006b8d36b9f4eb44e49f611cc7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/2gis-bratsk.dgdat" || return 1
  
}
