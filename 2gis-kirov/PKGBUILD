pkgname=2gis-kirov
pkgver=12
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-12.orig.zip")
md5sums=('f4f86d0828620b27f237acb144757e3f')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kirov.dgdat "${startdir}/pkg/opt/2gis/kirov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kirov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kirov.dglf" || return 1
}
