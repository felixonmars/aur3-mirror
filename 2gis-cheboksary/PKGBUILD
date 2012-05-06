pkgname=2gis-cheboksary
pkgver=7
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-7.orig.zip")
md5sums=('8766721b97ddeb0eea0f13e19a09c8e5')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
