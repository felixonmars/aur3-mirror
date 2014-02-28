pkgname=2gis-belgorod
pkgver=32
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-32.orig.zip")
md5sums=('9e903c39c237a05d51fb1642da46018f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/belgorod.dgdat" || return 1
  
}
