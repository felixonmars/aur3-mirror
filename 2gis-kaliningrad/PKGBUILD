pkgname=2gis-kaliningrad
pkgver=43
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kaliningrad/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kaliningrad-43.orig.zip")
md5sums=('c4216accbe11271ee90d67c0efca1f1e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/2gis-kaliningrad.dgdat" || return 1
  
}
