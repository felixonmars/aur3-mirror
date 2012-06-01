# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-tula
pkgver=19
pkgrel=1
pkgdesc="Map of Tula for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Tula-19.orig.zip")
md5sums=('1e4c8d8f3eb382e0d6b16c4803dc593f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Tula.dgdat "${startdir}/pkg/opt/2gis/tula.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Tula.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Tula.dglf" || return 1
     
}

