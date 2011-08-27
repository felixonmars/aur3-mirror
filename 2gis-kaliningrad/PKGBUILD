# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kaliningrad
pkgver=4
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-${pkgver}.orig.zip")
md5sums=('127cc4e11b8e94feda1e9c11dccd018b')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaliningrad.dgdat "${startdir}/pkg/opt/2gis/kaliningrad.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kaliningrad.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kaliningrad.dglf" || return 1
     
}

