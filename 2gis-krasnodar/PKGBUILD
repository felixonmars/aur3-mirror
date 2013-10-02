pkgname=2gis-krasnodar
pkgver=45
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-45.orig.zip")
md5sums=('deb81abcd5e3943f9d0040b26a96498b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/krasnodar.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/krasnodar.dglf" || return 1
}
