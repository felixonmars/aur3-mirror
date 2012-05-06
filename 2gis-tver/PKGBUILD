# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-tver
pkgver=10
pkgrel=1
pkgdesc="Map of Tver for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Tver-${pkgver}.orig.zip")
md5sums=('cc50c7e7d7870a93537e80db140c6d15')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Tver.dgdat "${startdir}/pkg/opt/2gis/tver.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Tver.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Tver.dglf" || return 1
     
}

