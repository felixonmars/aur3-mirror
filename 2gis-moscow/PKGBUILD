# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-moscow
pkgver=23
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-23.orig.zip")
md5sums=('854092aed47c927dcc5f2164e64f309f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Moscow.dgdat "${startdir}/pkg/opt/2gis/moscow.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Moscow.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Moscow.dglf" || return 1
     
}

