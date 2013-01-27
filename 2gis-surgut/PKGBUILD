# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-surgut
pkgver=23
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-23.orig.zip")
md5sums=('d285e80823ccf58aa6433f17e65a1857')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Surgut.dgdat "${startdir}/pkg/opt/2gis/surgut.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Surgut.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Surgut.dglf" || return 1
     
}

