pkgname=2gis-ulyanovsk
pkgver=9
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://ulyanovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulyanovsk-9.orig.zip")
md5sums=('5cc80cb902392b6471dfed2762ca942e')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ulyanovsk.dgdat "${startdir}/pkg/opt/2gis/ulyanovsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ulyanovsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ulyanovsk.dglf" || return 1
}
