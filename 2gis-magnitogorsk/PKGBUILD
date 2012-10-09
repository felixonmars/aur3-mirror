# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-magnitogorsk
pkgver=30
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-30.orig.zip")
md5sums=('63c094f367431a3d218fe6d3a7cc04cb')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Magnitogorsk.dgdat "${startdir}/pkg/opt/2gis/magnitogorsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Magnitogorsk.dglf" || return 1
     
}

