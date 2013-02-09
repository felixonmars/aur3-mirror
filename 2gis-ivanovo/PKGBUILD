pkgname=2gis-ivanovo
pkgver=10
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-10.orig.zip")
md5sums=('12b3e007d890c8eb2177d9483ab5bc5a')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
