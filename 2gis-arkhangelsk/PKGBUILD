pkgname=2gis-arkhangelsk
pkgver=17
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-17.orig.zip")
md5sums=('209ba0bd33237291086ec377e4e37178')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Arkhangelsk.dgdat "${startdir}/pkg/opt/2gis/arkhangelsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Arkhangelsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Arkhangelsk.dglf" || return 1
}
