pkgname=2gis-ivanovo
pkgver=1
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-1.orig.zip")
md5sums=('1e83f4118ffc907b829fa005c5b255e8')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
