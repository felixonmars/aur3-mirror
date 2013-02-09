pkgname=2gis-chita
pkgver=10
pkgrel=1
pkgdesc="Map of Chita for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://chita.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Chita-10.orig.zip")
md5sums=('2d6cc376c647c2d52d14842fbfbe70e9')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Chita.dgdat "${startdir}/pkg/opt/2gis/chita.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Chita.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Chita.dglf" || return 1
}
