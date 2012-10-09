# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-novosibirsk
pkgver=169
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-169.orig.zip")
md5sums=('d6037808bb28386f3039eb325132adbc')

build() {

   cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Novosibirsk.dgdat "${startdir}/pkg/opt/2gis/novosibirsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Novosibirsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Novosibirsk.dglf" || return 1
}
