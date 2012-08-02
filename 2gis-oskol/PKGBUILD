pkgname=2gis-oskol
pkgver=6
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-6.orig.zip")
md5sums=('fbf840aa1df6b8ab881107dc6aab3b86')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Stary Oskol.dgdat "${startdir}/pkg/opt/2gis/oskol.dgdat" || return 1
  
}
