pkgname=2gis-syktyvkar
pkgver=12
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-12.orig.zip")
md5sums=('35abf9d8b4eb9f12f83b2ef0318a23b9')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Syktyvkar.dgdat "${startdir}/pkg/opt/2gis/syktyvkar.dgdat" || return 1
  
}
