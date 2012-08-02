pkgname=2gis-kaluga
pkgver=6
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-6.orig.zip")
md5sums=('1c718539aec624d3cdae0394d18e936e')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
