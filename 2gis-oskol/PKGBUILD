pkgname=2gis-oskol
pkgver=8
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-8.orig.zip")
md5sums=('555c2390eac2ed5760ba759c56845d88')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Stary Oskol.dgdat "${startdir}/pkg/opt/2gis/oskol.dgdat" || return 1
  
}
