# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-tver
pkgver=15
pkgrel=1
pkgdesc="Map of Tver for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Tver-15.orig.zip")
md5sums=('5fcde8255ee67e1f5286746405a0e862')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Tver.dgdat "${startdir}/pkg/opt/2gis/tver.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Tver.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Tver.dglf" || return 1
     
}

