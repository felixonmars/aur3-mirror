# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kemerovo
pkgver=95
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-95.orig.zip")
md5sums=('e63e69fa606c502b3f4d5cd3c799bb85')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kemerovo.dgdat "${startdir}/pkg/opt/2gis/kemerovo.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kemerovo.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kemerovo.dglf" || return 1
     
}

