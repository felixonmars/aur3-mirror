# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-chelyabinsk
pkgver=62
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-62.orig.zip")
md5sums=('d82b9dc9d231e3237f8acb275fa0d15d')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Chelyabinsk.dgdat "${startdir}/pkg/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Chelyabinsk.dglf" || return 1
     
}

