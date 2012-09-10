pkgname=2gis-cheboksary
pkgver=11
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-11.orig.zip")
md5sums=('e0d88002e69fbcfbda10d38de5ed04a3')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
