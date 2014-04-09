pkgname=2gis-penza
pkgver=36
pkgrel=1
pkgdesc="Map of Penza for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Penza-36.orig.zip")
md5sums=('55a6ce77cbf4e130d4aacce979c7ffa4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/2gis-penza.dgdat" || return 1
  
}
