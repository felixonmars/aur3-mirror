# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-gornoaltaysk
pkgver=10
pkgrel=1
pkgdesc="Map of Gornoaltaysk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-${pkgver}.orig.zip")
md5sums=('9ab08de0e9e48100755bf1bf44b1530e')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Gornoaltaysk.dgdat "${startdir}/pkg/opt/2gis/gornoaltaysk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Gornoaltaysk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Gornoaltaysk.dglf" || return 1

}
