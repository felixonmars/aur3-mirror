pkgname=2gis-kaluga
pkgver=5
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, July 2012"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-5.orig.zip")
md5sums=('1b7e1adcf19d9ba21b3e250d215cc9c4')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
