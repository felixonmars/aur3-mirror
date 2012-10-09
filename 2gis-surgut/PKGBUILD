# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-surgut
pkgver=20
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-20.orig.zip")
md5sums=('703b2a0ca1dde6e9fa9f7c689fef180f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Surgut.dgdat "${startdir}/pkg/opt/2gis/surgut.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Surgut.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Surgut.dglf" || return 1
     
}

