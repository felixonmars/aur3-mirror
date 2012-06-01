# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kemerovo
pkgver=86
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-86.orig.zip")
md5sums=('d215beda5fb36d94c30b1cd26c921d2a')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kemerovo.dgdat "${startdir}/pkg/opt/2gis/kemerovo.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kemerovo.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kemerovo.dglf" || return 1
     
}

