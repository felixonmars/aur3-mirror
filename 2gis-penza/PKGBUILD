# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-penza
pkgver=18
pkgrel=1
pkgdesc="Map of Penza for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Penza-18.orig.zip")
md5sums=('69ab3ac3d2961e9bdbcc5672e57f61c9')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Penza.dgdat "${startdir}/pkg/opt/2gis/penza.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Penza.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Penza.dglf" || return 1
     
}

