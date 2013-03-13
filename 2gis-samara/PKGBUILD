# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-samara
pkgver=56
pkgrel=1
pkgdesc="Map of Samara for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Samara-56.orig.zip")
md5sums=('62e08b93fbb6b26732a82a2fd58ede5d')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Samara.dgdat "${startdir}/pkg/opt/2gis/samara.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Samara.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Samara.dglf" || return 1
     
}

