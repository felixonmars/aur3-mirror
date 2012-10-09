# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kaliningrad
pkgver=20
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-20.orig.zip")
md5sums=('f96b9e5d39ab144fc1a75ebc17daa9e2')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaliningrad.dgdat "${startdir}/pkg/opt/2gis/kaliningrad.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kaliningrad.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kaliningrad.dglf" || return 1
     
}

