# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-chelyabinsk
pkgver=67
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-67.orig.zip")
md5sums=('a0797119fb59754e9c3a046f7ddc20ab')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Chelyabinsk.dgdat "${startdir}/pkg/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Chelyabinsk.dglf" || return 1
     
}

