# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-gornoaltaysk
pkgver=25
pkgrel=1
pkgdesc="Map of Gornoaltaysk for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://altai.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-${pkgver}.orig.zip")
md5sums=('dbc4fcf0c8ef6de465e6100937b858aa')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Gornoaltaysk.dgdat "${startdir}/pkg/opt/2gis/gornoaltaysk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Gornoaltaysk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Gornoaltaysk.dglf" || return 1
     
}

