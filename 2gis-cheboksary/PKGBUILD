pkgname=2gis-cheboksary
pkgver=16
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-16.orig.zip")
md5sums=('302de3cfe1be651e14d6c5cc95dc892e')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
