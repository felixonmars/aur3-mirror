# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ufa
pkgver=60
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-60.orig.zip")
md5sums=('22c6e1b92451b07bc4844ad5c3d1c08a')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ufa.dgdat "${startdir}/pkg/opt/2gis/ufa.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ufa.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ufa.dglf" || return 1
     
}

