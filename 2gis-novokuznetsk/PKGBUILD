# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-novokuznetsk
pkgver=81
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-${pkgver}.orig.zip")
md5sums=('8a7148b23f412311837a72683d1c8c57')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Novokuznetsk.dgdat "${startdir}/pkg/opt/2gis/novokuznetsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Novokuznetsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Novokuznetsk.dglf" || return 1
     
}

