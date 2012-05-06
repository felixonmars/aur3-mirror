pkgname=2gis-vladimir
pkgver=3
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-3.orig.zip")
md5sums=('d5f99f4a83e320837343a08bd14b4c88')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladimir.dgdat "${startdir}/pkg/opt/2gis/vladimir.dgdat" || return 1
  
}
