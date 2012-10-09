# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-novokuznetsk
pkgver=86
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-86.orig.zip")
md5sums=('6853ae8610f59fd781b5f33db2151ef7')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Novokuznetsk.dgdat "${startdir}/pkg/opt/2gis/novokuznetsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Novokuznetsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Novokuznetsk.dglf" || return 1
     
}

