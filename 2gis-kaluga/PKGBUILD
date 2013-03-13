pkgname=2gis-kaluga
pkgver=13
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-13.orig.zip")
md5sums=('3b2ea79db4a34c20b7f6ba174c663267')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
