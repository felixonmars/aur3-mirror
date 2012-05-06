# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-voronezh
pkgver=22
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-${pkgver}.orig.zip")
md5sums=('ae4c31552e73e1fe936b401699deefe5')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Voronezh.dgdat "${startdir}/pkg/opt/2gis/voronezh.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Voronezh.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Voronezh.dglf" || return 1
     
}

