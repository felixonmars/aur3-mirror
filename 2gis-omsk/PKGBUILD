# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-omsk
pkgver=81
pkgrel=1
pkgdesc="Map of Omsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-${pkgver}.orig.zip")
md5sums=('da4a8c9e6a6d8f2317833392d5f84192')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Omsk.dgdat "${startdir}/pkg/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Omsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Omsk.dglf" || return 1

}
