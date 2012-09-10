# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-biysk
pkgver=47
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-47.orig.zip")
md5sums=('f0a30baad9bf77d6a0d1913ffa84bc70')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Biysk.dgdat "${startdir}/pkg/opt/2gis/biysk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Biysk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Biysk.dglf" || return 1
     
}

