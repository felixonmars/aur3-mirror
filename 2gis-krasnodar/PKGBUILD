# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-krasnodar
pkgver=38
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-38.orig.zip")
md5sums=('aa6225bea76acd83c2e137acef02d0ac')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Krasnodar.dgdat "${startdir}/pkg/opt/2gis/krasnodar.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Krasnodar.dglf" || return 1
     
}

