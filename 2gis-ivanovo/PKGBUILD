pkgname=2gis-ivanovo
pkgver=6
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-6.orig.zip")
md5sums=('2a973c8e7205488b7396d820719cc2c7')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
