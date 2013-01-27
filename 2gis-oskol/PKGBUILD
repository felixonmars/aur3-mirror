pkgname=2gis-oskol
pkgver=11
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-11.orig.zip")
md5sums=('5dbe0cc6468711d323a9ebaeb88bad72')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Stary Oskol.dgdat "${startdir}/pkg/opt/2gis/oskol.dgdat" || return 1
  
}
