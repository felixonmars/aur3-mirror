pkgname=2gis-arkhangelsk
pkgver=19
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-19.orig.zip")
md5sums=('f684786d375ac728cac4ba0716992cf7')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Arkhangelsk.dgdat "${startdir}/pkg/opt/2gis/arkhangelsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Arkhangelsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Arkhangelsk.dglf" || return 1
}
