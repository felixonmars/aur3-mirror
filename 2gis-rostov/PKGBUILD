pkgname=2gis-rostov
pkgver=49
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://rostov-na-donu.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-49.orig.zip")
md5sums=('a64b910e5531aa13e2ab685594b7e3e8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/2gis-rostov.dgdat" || return 1
  
}
