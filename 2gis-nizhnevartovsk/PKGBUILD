# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-nizhnevartovsk
pkgver=60
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-${pkgver}.orig.zip")
md5sums=('077a5569c23ed38c5cd1b6dfa5db2172')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nizhnevartovsk.dgdat "${startdir}/pkg/opt/2gis/nizhnevartovsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nizhnevartovsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nizhnevartovsk.dglf" || return 1

}
