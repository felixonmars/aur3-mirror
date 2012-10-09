# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-omsk
pkgver=98
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-98.orig.zip")
md5sums=('1dfe817be22fdbd4a7ea017daba4c6c9')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Omsk.dgdat "${startdir}/pkg/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Omsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Omsk.dglf" || return 1
     
}

