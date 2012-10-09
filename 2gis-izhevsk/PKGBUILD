# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-izhevsk
pkgver=19
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-19.orig.zip")
md5sums=('3ec42a8a2c4e54991747e9cc3bc08ec9')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Izhevsk.dgdat "${startdir}/pkg/opt/2gis/izhevsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Izhevsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Izhevsk.dglf" || return 1
     
}

