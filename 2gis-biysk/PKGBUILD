# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-biysk
pkgver=49
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, November 2012"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-49.orig.zip")
md5sums=('14d621b6fad6f609214b60677d6caaf2')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Biysk.dgdat "${startdir}/pkg/opt/2gis/biysk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Biysk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Biysk.dglf" || return 1
     
}

