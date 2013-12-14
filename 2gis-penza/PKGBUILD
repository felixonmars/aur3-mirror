pkgname=2gis-penza
pkgver=32
pkgrel=1
pkgdesc="Map of Penza for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Penza-32.orig.zip")
md5sums=('fd34a78496d93e21b61e369b0224b4e9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  
}
