pkgname=2gis-sochi
pkgver=35
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://sochi.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Sochi-35.orig.zip")
md5sums=('df2c74aed44d99c684334d735b156a7b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/sochi.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Sochi.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/sochi.dglf" || return 1
}
