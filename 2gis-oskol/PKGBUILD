pkgname=2gis-oskol
pkgver=5
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, July 2012"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-5.orig.zip")
md5sums=('648939065af253653e2a04d5bc11dda2')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Stary Oskol.dgdat "${startdir}/pkg/opt/2gis/oskol.dgdat" || return 1
  
}
