# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-yaroslavl
pkgver=23
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-${pkgver}.orig.zip")
md5sums=('9c787355f439a4bc15aaf85ea5d167da')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yaroslavl.dgdat "${startdir}/pkg/opt/2gis/yaroslavl.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Yaroslavl.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Yaroslavl.dglf" || return 1
     
}

