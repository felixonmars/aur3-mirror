pkgname=2gis-kaluga
pkgver=3
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-3.orig.zip")
md5sums=('b622a31aafa5c2973786462ccedbc9ea')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
