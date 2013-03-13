# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-magnitogorsk
pkgver=35
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-35.orig.zip")
md5sums=('ccf945afac259dbed1f95336cf2fec10')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Magnitogorsk.dgdat "${startdir}/pkg/opt/2gis/magnitogorsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Magnitogorsk.dglf" || return 1
     
}

