# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-nizhnevartovsk
pkgver=58
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-${pkgver}.orig.zip")
md5sums=('b0250c8147937572e0c3bb9d50b350e5')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nizhnevartovsk.dgdat "${startdir}/pkg/opt/2gis/nizhnevartovsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nizhnevartovsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nizhnevartovsk.dglf" || return 1

}
