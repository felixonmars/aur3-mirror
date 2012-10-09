pkgname=2gis-yakutsk
pkgver=14
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-14.orig.zip")
md5sums=('022754a0383652ebf1a9c47325b02422')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yakutsk.dgdat "${startdir}/pkg/opt/2gis/yakutsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Yakutsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Yakutsk.dglf" || return 1
}
