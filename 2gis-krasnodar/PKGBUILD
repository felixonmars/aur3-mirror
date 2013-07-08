pkgname=2gis-krasnodar
pkgver=42
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-42.orig.zip")
md5sums=('f6ebe25b0d5635d6c095a966d0625a22')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/krasnodar.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/krasnodar.dglf" || return 1
}
