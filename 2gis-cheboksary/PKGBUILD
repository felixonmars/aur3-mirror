pkgname=2gis-cheboksary
pkgver=9
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, July 2012"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-9.orig.zip")
md5sums=('08fa73914f60ca4ef0b5394b80ce458a')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
