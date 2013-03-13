pkgname=2gis-ivanovo
pkgver=11
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-11.orig.zip")
md5sums=('d5710fef8a5060f6bbcf4c8c750910da')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
