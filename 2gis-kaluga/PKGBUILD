pkgname=2gis-kaluga
pkgver=8
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-8.orig.zip")
md5sums=('960d89913b9fb1f075f5e8abc8c5a5d4')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
