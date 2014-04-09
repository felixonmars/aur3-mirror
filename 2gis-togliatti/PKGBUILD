pkgname=2gis-togliatti
pkgver=69
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://togliatti.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-69.orig.zip")
md5sums=('0f0aadc5cdb538d220b9cc4ceb73210d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/2gis-togliatti.dgdat" || return 1
  
}
