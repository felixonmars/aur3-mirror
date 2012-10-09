# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-saratov
pkgver=18
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-18.orig.zip")
md5sums=('04d6c6116f21f06ae67c92634be7c336')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Saratov.dgdat "${startdir}/pkg/opt/2gis/saratov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Saratov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Saratov.dglf" || return 1
     
}

