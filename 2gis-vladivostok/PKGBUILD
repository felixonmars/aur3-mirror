# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-vladivostok
pkgver=36
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-36.orig.zip")
md5sums=('f67f4837232b41d010bb23e90b6afe08')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladivostok.dgdat "${startdir}/pkg/opt/2gis/vladivostok.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Vladivostok.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Vladivostok.dglf" || return 1
     
}

