pkgname=2gis-oskol
pkgver=12
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-12.orig.zip")
md5sums=('6d5fd82277786d8d4459a6bd272f2d10')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Stary Oskol.dgdat "${startdir}/pkg/opt/2gis/oskol.dgdat" || return 1
  
}
