pkgname=2gis-kaluga
pkgver=11
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-11.orig.zip")
md5sums=('5b3d0e11a7ee4331b6f918bfe5a099df')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
