# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-tula
pkgver=18
pkgrel=1
pkgdesc="Map of Tula for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Tula-${pkgver}.orig.zip")
md5sums=('3298379f61f32f2a9a0ceb0da8f1d53c')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Tula.dgdat "${startdir}/pkg/opt/2gis/tula.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Tula.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Tula.dglf" || return 1
     
}

