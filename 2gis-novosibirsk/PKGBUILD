pkgname=2gis-novosibirsk
pkgver=185
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-185.orig.zip")
md5sums=('345a98b28f85f986bd97207d532b9a86')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/novosibirsk.dgdat" || return 1
  
}
