pkgname=2gis-yakutsk
pkgver=12
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-12.orig.zip")
md5sums=('eeb842773da5f3738cddd057d906caf7')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yakutsk.dgdat "${startdir}/pkg/opt/2gis/yakutsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Yakutsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Yakutsk.dglf" || return 1
}
