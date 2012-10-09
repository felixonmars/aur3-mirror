# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-irkutsk
pkgver=78
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-78.orig.zip")
md5sums=('1f2f6b1394bbb2b23b2faeadb407bfbf')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Irkutsk.dgdat "${startdir}/pkg/opt/2gis/irkutsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Irkutsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Irkutsk.dglf" || return 1
     
}

