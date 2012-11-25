pkgname=2gis-arkhangelsk
pkgver=15
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, November 2012"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-15.orig.zip")
md5sums=('7c99d43ce1d91bc9e1f4124ab073d2a4')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Arkhangelsk.dgdat "${startdir}/pkg/opt/2gis/arkhangelsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Arkhangelsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Arkhangelsk.dglf" || return 1
}
