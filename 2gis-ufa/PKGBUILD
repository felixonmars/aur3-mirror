# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ufa
pkgver=55
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-55.orig.zip")
md5sums=('81d775e137240096f1e4c40cb84586b4')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ufa.dgdat "${startdir}/pkg/opt/2gis/ufa.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ufa.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ufa.dglf" || return 1
     
}

