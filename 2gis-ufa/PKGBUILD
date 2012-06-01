# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ufa
pkgver=51
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-51.orig.zip")
md5sums=('80474ec13e45d9b4d33989c0691b6574')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ufa.dgdat "${startdir}/pkg/opt/2gis/ufa.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ufa.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ufa.dglf" || return 1
     
}

