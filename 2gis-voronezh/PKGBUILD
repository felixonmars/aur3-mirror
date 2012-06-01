# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-voronezh
pkgver=23
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-23.orig.zip")
md5sums=('97f2fce37c314e8d0d0d017f79786540')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Voronezh.dgdat "${startdir}/pkg/opt/2gis/voronezh.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Voronezh.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Voronezh.dglf" || return 1
     
}

