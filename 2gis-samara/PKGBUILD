pkgname=2gis-samara
pkgver=65
pkgrel=1
pkgdesc="Map of Samara for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Samara-65.orig.zip")
md5sums=('43fbc47f9094883d8b1e16b72e51f496')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Samara.dgdat" "${pkgdir}/opt/2gis/samara.dgdat" || return 1
  
}
