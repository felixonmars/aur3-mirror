# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-kazan
pkgver=29
pkgrel=1
pkgdesc="Map of Kazan for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-${pkgver}.orig.zip")
md5sums=('38a030230b49588cd58e9e306d249e67')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kazan.dgdat "${startdir}/pkg/opt/2gis/kazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kazan.dglf" || return 1

}
