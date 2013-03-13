pkgname=2gis-vladimir
pkgver=13
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-13.orig.zip")
md5sums=('143722db045f3a259b2addfdd541ae51')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladimir.dgdat "${startdir}/pkg/opt/2gis/vladimir.dgdat" || return 1
  
}
