pkgname=2gis-ivanovo
pkgver=16
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-16.orig.zip")
md5sums=('29742856a83bcf808b88d18ddc79d05e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/ivanovo.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ivanovo.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ivanovo.dglf" || return 1
}
