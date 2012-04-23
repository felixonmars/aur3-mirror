# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-spb
pkgver=14
pkgrel=1
pkgdesc="Map of Spb for 2GIS, April 2012"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Spb-${pkgver}.orig.zip")
md5sums=('9f0094f9e97586b54c5db12a52743d2a')

build() {

   cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Spb.dgdat "${startdir}/pkg/opt/2gis/spb.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Spb.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Spb.dglf" || return 1

}

