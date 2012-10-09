# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-nizhnevartovsk
pkgver=77
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://nizhnevartovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-77.orig.zip")
md5sums=('dfd94184f2df7d31886b9291c35666f4')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nizhnevartovsk.dgdat "${startdir}/pkg/opt/2gis/nizhnevartovsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nizhnevartovsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nizhnevartovsk.dglf" || return 1
     
}

