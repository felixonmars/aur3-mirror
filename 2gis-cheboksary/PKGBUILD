pkgname=2gis-cheboksary
pkgver=29
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-29.orig.zip")
md5sums=('181c14f13699145c988866c18ff5a723')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/cheboksary.dgdat" || return 1
  
}
