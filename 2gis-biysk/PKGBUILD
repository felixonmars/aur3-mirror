# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-biysk
pkgver=31
pkgrel=1
pkgdesc="Map of Biysk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-${pkgver}.orig.zip")
md5sums=('18fb0e3a5eb7f0968d24f61707ea9ef4')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Biysk.dgdat "${startdir}/pkg/opt/2gis/biysk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Biysk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Biysk.dglf" || return 1

}
