# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-kazan
pkgver=30
pkgrel=1
pkgdesc="Map of Kazan for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-${pkgver}.orig.zip")
md5sums=('51969cd657253e378f0cfc99af25d7d1')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kazan.dgdat "${startdir}/pkg/opt/2gis/kazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kazan.dglf" || return 1

}
