pkgname=2gis-ivanovo
pkgver=5
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-5.orig.zip")
md5sums=('73e7aa7c3011e5917aa0a98c28634216')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
