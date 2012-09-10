# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-sochi
pkgver=26
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://sochi.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Sochi-26.orig.zip")
md5sums=('690475c2468abc361c4dd32b886b5640')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Sochi.dgdat "${startdir}/pkg/opt/2gis/sochi.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Sochi.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Sochi.dglf" || return 1
     
}

