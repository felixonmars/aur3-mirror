# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-nizhnevartovsk
pkgver=82
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://nizhnevartovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-82.orig.zip")
md5sums=('9e34754654da18395d638fa3abb51c44')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nizhnevartovsk.dgdat "${startdir}/pkg/opt/2gis/nizhnevartovsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nizhnevartovsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nizhnevartovsk.dglf" || return 1
     
}

