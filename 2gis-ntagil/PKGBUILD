# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ntagil
pkgver=12
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-12.orig.zip")
md5sums=('19a905b56a9360d97ceb33454d5a206e')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ntagil.dgdat "${startdir}/pkg/opt/2gis/ntagil.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ntagil.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ntagil.dglf" || return 1
     
}

