pkgname=2gis-kirov
pkgver=5
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-5.orig.zip")
md5sums=('dcec34f5e5d4b63bbf65c11ba13a5814')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kirov.dgdat "${startdir}/pkg/opt/2gis/kirov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kirov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kirov.dglf" || return 1
}
