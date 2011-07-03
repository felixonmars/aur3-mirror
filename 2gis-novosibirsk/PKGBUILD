# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-novosibirsk
pkgver=154
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-${pkgver}.orig.zip")
md5sums=('e49653aa5bd968b9a555ed77642635e1')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Novosibirsk.dgdat "${startdir}/pkg/opt/2gis/novosibirsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Novosibirsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Novosibirsk.dglf" || return 1
     
}

