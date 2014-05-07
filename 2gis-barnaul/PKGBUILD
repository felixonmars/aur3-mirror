pkgname=2gis-barnaul
pkgver=111
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-111.orig.zip")
md5sums=('607af4b9a3648ca682943d7f63c724ef')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/2gis-barnaul.dgdat" || return 1
  
}
