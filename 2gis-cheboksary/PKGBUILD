pkgname=2gis-cheboksary
pkgver=12
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-12.orig.zip")
md5sums=('794d75a30c857cce5126b1ef08d3cd3e')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
