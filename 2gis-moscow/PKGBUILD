# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-moscow
pkgver=17
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-17.orig.zip")
md5sums=('037e633c3b5aaecccb548be10d70715d')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Moscow.dgdat "${startdir}/pkg/opt/2gis/moscow.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Moscow.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Moscow.dglf" || return 1
     
}

