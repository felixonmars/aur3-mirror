pkgname=2gis-gornoaltaysk
pkgver=37
pkgrel=2
pkgdesc="Map of Gorny Altai for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://altai.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-37.orig.zip")
md5sums=('e1a170fe9f93c92febfee1e84a989724')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Gornoaltaysk.dgdat" "${pkgdir}/opt/2gis/gornoaltaysk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Gornoaltaysk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/gornoaltaysk.dglf" || return 1
}
