pkgname=2gis-kirov
pkgver=9
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-9.orig.zip")
md5sums=('9a2383880b1e0807d1394a8603c880cc')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kirov.dgdat "${startdir}/pkg/opt/2gis/kirov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kirov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kirov.dglf" || return 1
}
