pkgname=2gis-gornoaltaysk
pkgver=40
pkgrel=1
pkgdesc="Map of Gorny Altai for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://altai.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-40.orig.zip")
md5sums=('28b98993beabdd4d13423012ed85dc8e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Gornoaltaysk.dgdat" "${pkgdir}/opt/2gis/gornoaltaysk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Gornoaltaysk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/gornoaltaysk.dglf" || return 1
}
