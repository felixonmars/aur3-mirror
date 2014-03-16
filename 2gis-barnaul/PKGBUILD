pkgname=2gis-barnaul
pkgver=109
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-109.orig.zip")
md5sums=('7ab3848507f54585d65de95bf30c7e07')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/barnaul.dgdat" || return 1
  
}
