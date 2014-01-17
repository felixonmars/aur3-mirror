pkgname=2gis-rostov
pkgver=46
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-46.orig.zip")
md5sums=('4fad49f100017d7f88f8b26c91b4acd2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  
}
