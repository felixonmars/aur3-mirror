# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-krasnodar
pkgver=33
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-33.orig.zip")
md5sums=('01fa3ccd926ebf1a0c146ff7b5d3ca7d')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Krasnodar.dgdat "${startdir}/pkg/opt/2gis/krasnodar.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Krasnodar.dglf" || return 1
     
}

