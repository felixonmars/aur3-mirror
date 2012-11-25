pkgname=2gis-vladimir
pkgver=9
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, November 2012"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-9.orig.zip")
md5sums=('5986eeea357413321fd126ad790e70de')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladimir.dgdat "${startdir}/pkg/opt/2gis/vladimir.dgdat" || return 1
  
}
