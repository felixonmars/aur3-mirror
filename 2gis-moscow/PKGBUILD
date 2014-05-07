pkgname=2gis-moscow
pkgver=37
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://moscow.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-37.orig.zip")
md5sums=('04ad0ab64442a7137122339150903e89')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Moscow.dgdat" "${pkgdir}/opt/2gis/2gis-moscow.dgdat" || return 1
  
}
