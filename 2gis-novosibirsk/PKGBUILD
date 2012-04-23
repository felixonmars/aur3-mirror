# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-novosibirsk
pkgver=163
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, April 2012"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-${pkgver}.orig.zip")
md5sums=('245abd480c8cbd9ee993e4011f19bee9')

build() {

   cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Novosibirsk.dgdat "${startdir}/pkg/opt/2gis/novosibirsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Novosibirsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Novosibirsk.dglf" || return 1
}
