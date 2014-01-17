pkgname=2gis-kazan
pkgver=62
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-62.orig.zip")
md5sums=('4b862a53749cc6b13758c96c31bb7f4c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/kazan.dgdat" || return 1
  
}
