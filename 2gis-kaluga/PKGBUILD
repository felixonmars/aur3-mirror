pkgname=2gis-kaluga
pkgver=12
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-12.orig.zip")
md5sums=('7cd423e3123104a1b8980b58ffe8e019')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
