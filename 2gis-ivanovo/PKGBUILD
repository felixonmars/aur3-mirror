pkgname=2gis-ivanovo
pkgver=2
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-2.orig.zip")
md5sums=('51e55aee00f7fa72b3759ec152ab9bde')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
