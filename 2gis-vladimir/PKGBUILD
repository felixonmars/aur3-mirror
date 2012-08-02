pkgname=2gis-vladimir
pkgver=6
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-6.orig.zip")
md5sums=('a778b7e3a5fffe75ac1562447af66828')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladimir.dgdat "${startdir}/pkg/opt/2gis/vladimir.dgdat" || return 1
  
}
