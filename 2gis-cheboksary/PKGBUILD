pkgname=2gis-cheboksary
pkgver=10
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-10.orig.zip")
md5sums=('2fc77746424b744d7d36e367f3ef7e19')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
