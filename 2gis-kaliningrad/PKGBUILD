# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kaliningrad
pkgver=15
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-${pkgver}.orig.zip")
md5sums=('189ff7e8f380a2c5180f8c0409253d7c')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaliningrad.dgdat "${startdir}/pkg/opt/2gis/kaliningrad.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kaliningrad.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kaliningrad.dglf" || return 1
     
}

