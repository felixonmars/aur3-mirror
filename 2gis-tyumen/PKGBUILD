pkgname=2gis-tyumen
pkgver=84
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-84.orig.zip")
md5sums=('5360f154630a66e6e1d0c6c096b25252')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/tyumen.dgdat" || return 1
  
}
