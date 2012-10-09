# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-rostov
pkgver=31
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-31.orig.zip")
md5sums=('a0877d479bbf41efe8332bd78ba7c11f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Rostov.dgdat "${startdir}/pkg/opt/2gis/rostov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Rostov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Rostov.dglf" || return 1
     
}

