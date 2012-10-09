# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-gornoaltaysk
pkgver=30
pkgrel=1
pkgdesc="Map of Gorny Altai for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://altai.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-30.orig.zip")
md5sums=('f422ba09778d0250fbf4cc8e82199f7a')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Gornoaltaysk.dgdat "${startdir}/pkg/opt/2gis/gornoaltaysk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Gornoaltaysk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Gornoaltaysk.dglf" || return 1
     
}

