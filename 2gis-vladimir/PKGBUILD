pkgname=2gis-vladimir
pkgver=12
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-12.orig.zip")
md5sums=('1e8ff6610e56dc1fa67750e6979aae72')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladimir.dgdat "${startdir}/pkg/opt/2gis/vladimir.dgdat" || return 1
  
}
