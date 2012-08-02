pkgname=2gis-ivanovo
pkgver=4
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-4.orig.zip")
md5sums=('fb91f297b6eb5f432dd826b8dbccc8fe')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
