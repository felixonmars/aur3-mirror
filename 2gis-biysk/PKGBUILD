# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-biysk
pkgver=43
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-${pkgver}.orig.zip")
md5sums=('39a1c50f2ac2047d76fcdbd0c5c0176a')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Biysk.dgdat "${startdir}/pkg/opt/2gis/biysk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Biysk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Biysk.dglf" || return 1
     
}

