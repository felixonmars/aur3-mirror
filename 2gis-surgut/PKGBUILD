# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-surgut
pkgver=25
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-25.orig.zip")
md5sums=('c7afda1d9b819f1b0a15e2f60fa0b902')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Surgut.dgdat "${startdir}/pkg/opt/2gis/surgut.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Surgut.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Surgut.dglf" || return 1
     
}

