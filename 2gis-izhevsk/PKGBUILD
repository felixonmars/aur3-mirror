# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-izhevsk
pkgver=22
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-22.orig.zip")
md5sums=('f3a25187c4553ce2eff21f38f86732ab')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Izhevsk.dgdat "${startdir}/pkg/opt/2gis/izhevsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Izhevsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Izhevsk.dglf" || return 1
     
}

