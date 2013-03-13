# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-tver
pkgver=20
pkgrel=1
pkgdesc="Map of Tver for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Tver-20.orig.zip")
md5sums=('2f137eb297ac45555220676afea8d84e')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Tver.dgdat "${startdir}/pkg/opt/2gis/tver.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Tver.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Tver.dglf" || return 1
     
}

