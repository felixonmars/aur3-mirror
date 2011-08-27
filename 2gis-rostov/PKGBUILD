# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-rostov
pkgver=17
pkgrel=1
pkgdesc="Map of Rostov for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-${pkgver}.orig.zip")
md5sums=('b733224f969922c62e08ab0825d18bc5')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Rostov.dgdat "${startdir}/pkg/opt/2gis/rostov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Rostov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Rostov.dglf" || return 1
     
}

