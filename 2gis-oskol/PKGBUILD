pkgname=2gis-oskol
pkgver=7
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-7.orig.zip")
md5sums=('300249db60ce57db15acd784a9ab7333')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Stary Oskol.dgdat "${startdir}/pkg/opt/2gis/oskol.dgdat" || return 1
  
}
