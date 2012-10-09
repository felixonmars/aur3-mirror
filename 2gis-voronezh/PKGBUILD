# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-voronezh
pkgver=27
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-27.orig.zip")
md5sums=('f211f7b8854c5c7e2f4782e7decd2de7')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Voronezh.dgdat "${startdir}/pkg/opt/2gis/voronezh.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Voronezh.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Voronezh.dglf" || return 1
     
}

