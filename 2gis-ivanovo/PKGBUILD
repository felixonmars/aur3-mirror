pkgname=2gis-ivanovo
pkgver=9
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-9.orig.zip")
md5sums=('3263832e7a147c7444ced3d539f30490')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
