pkgname=2gis-cheboksary
pkgver=17
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-17.orig.zip")
md5sums=('8cea1d4dc47bdf6845446a32a9d4e5c3')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
