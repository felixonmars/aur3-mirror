pkgname=2gis-kurgan
pkgver=91
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-91.orig.zip")
md5sums=('95a78e98c9aaa29390df7bec659345a4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/kurgan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kurgan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kurgan.dglf" || return 1
}
