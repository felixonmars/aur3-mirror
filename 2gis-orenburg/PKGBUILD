# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-orenburg
pkgver=15
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-15.orig.zip")
md5sums=('0b5ed0a64d140a51c7accb1bbc05378d')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Orenburg.dgdat "${startdir}/pkg/opt/2gis/orenburg.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Orenburg.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Orenburg.dglf" || return 1
     
}

