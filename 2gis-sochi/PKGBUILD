pkgname=2gis-sochi
pkgver=34
pkgrel=2
pkgdesc="Map of Sochi for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://sochi.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Sochi-34.orig.zip")
md5sums=('3b71258b47a2253a90cd3f3b2e708f63')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/sochi.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Sochi.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/sochi.dglf" || return 1
}
