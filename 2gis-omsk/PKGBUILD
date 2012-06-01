# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-omsk
pkgver=94
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-94.orig.zip")
md5sums=('628ac7b10747e72e1de0def9e9cdc719')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Omsk.dgdat "${startdir}/pkg/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Omsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Omsk.dglf" || return 1
     
}

