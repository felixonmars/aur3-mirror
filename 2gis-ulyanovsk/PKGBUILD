pkgname=2gis-ulyanovsk
pkgver=13
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, December 2012"
arch=('i686' 'x86_64')
url="http://ulyanovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ulyanovsk-13.orig.zip")
md5sums=('4ba742d653dac214f90af3f306c04a3b')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ulyanovsk.dgdat "${startdir}/pkg/opt/2gis/ulyanovsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ulyanovsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ulyanovsk.dglf" || return 1
}
