pkgname=2gis-kaluga
pkgver=4
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-4.orig.zip")
md5sums=('9cebf7f78f130a19d4de2b7d45741d2e')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
