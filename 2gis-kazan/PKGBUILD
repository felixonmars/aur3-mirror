pkgname=2gis-kazan
pkgver=64
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-64.orig.zip")
md5sums=('b5d07f9694f8263a7872ea9cdef9ccbe')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/kazan.dgdat" || return 1
  
}
