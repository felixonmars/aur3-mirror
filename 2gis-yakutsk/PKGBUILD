pkgname=2gis-yakutsk
pkgver=18
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-18.orig.zip")
md5sums=('8f84cb9db8890fa4e6dd5faf9b4deed2')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yakutsk.dgdat "${startdir}/pkg/opt/2gis/yakutsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Yakutsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Yakutsk.dglf" || return 1
}
