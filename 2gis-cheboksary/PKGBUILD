pkgname=2gis-cheboksary
pkgver=14
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, December 2012"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-14.orig.zip")
md5sums=('e0428c30f16c51e5444b447f6d431572')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
