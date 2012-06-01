# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-orenburg
pkgver=11
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-11.orig.zip")
md5sums=('cbec43a9cc86212cf00402679303663c')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Orenburg.dgdat "${startdir}/pkg/opt/2gis/orenburg.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Orenburg.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Orenburg.dglf" || return 1
     
}

