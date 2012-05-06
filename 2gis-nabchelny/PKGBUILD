# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-nabchelny
pkgver=23
pkgrel=1
pkgdesc="Map of Nabchelny for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-${pkgver}.orig.zip")
md5sums=('8fa83c6f454f5d82a0587585e0d3ce74')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nabchelny.dgdat "${startdir}/pkg/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nabchelny.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nabchelny.dglf" || return 1
     
}

