pkgname=2gis-rostov
pkgver=44
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-44.orig.zip")
md5sums=('239e23e284fd1497fa4c8a24778c7669')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  
}
