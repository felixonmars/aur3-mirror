pkgname=2gis-barnaul
pkgver=106
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-106.orig.zip")
md5sums=('c73c911cbcee25c4dfaf7aa4e852bdf3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/barnaul.dgdat" || return 1
  
}
