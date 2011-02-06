# Contributor: max1m <keyworker@rambler.ru>

pkgname=2gis-nabchelny
pkgver=8
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-${pkgver}.orig.zip")
md5sums=('c2bc0330d3ddfa5ff335003a265338d2')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nabchelny.dgdat "${startdir}/pkg/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nabchelny.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nabchelny.dglf" || return 1

}
